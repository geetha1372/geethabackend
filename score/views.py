from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User
from .models import UserDifficulty
from .serializers import UserDifficultySerializer
from rest_framework.permissions import AllowAny

class DifficultySettingsView(APIView):
    permission_classes = [AllowAny] # In a real app, use IsAuthenticated

    def get(self, request, user_id):
        difficulty, created = UserDifficulty.objects.get_or_create(user_id=user_id)
        serializer = UserDifficultySerializer(difficulty)
        return Response(serializer.data)

    def post(self, request):
        user_id = request.data.get('user_id')
        if not user_id:
            return Response({"error": "User ID is required"}, status=status.HTTP_400_BAD_REQUEST)
        
        user = get_object_or_404(User, id=user_id)
        difficulty, created = UserDifficulty.objects.get_or_create(user=user)
        
        serializer = UserDifficultySerializer(difficulty, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "Difficulty settings updated successfully", "data": serializer.data}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

from .models import TrainingSession
from .serializers import TrainingSessionSerializer
from django.db.models import Max

class AddTrainingSessionView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        user_id = request.data.get('user_id')
        user = get_object_or_404(User, id=user_id)
        
        serializer = TrainingSessionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=user)
            return Response({"message": "Training session saved successfully"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class GameScoresView(APIView):
    permission_classes = [AllowAny]

    def get(self, request, user_id):
        user = get_object_or_404(User, id=user_id)
        sessions = TrainingSession.objects.filter(user=user)
        
        # Get max score for each game
        game_scores = sessions.values('game_name').annotate(max_score=Max('score'))
        result = {item['game_name']: item['max_score'] for item in game_scores}
        
        return Response(result)

class SessionHistoryView(APIView):
    permission_classes = [AllowAny]

    def get(self, request, user_id):
        user = get_object_or_404(User, id=user_id)
        sessions = TrainingSession.objects.filter(user=user).order_by('-created_at')
        serializer = TrainingSessionSerializer(sessions, many=True)
        
        # Format for frontend (matching SessionHistoryItem in Kotlin)
        history = []
        for item in serializer.data:
            history.append({
                "game_name": item['game_name'],
                "score": item['score'],
                "accuracy_percentage": item['accuracy_percentage'],
                "average_reaction_time_ms": item['average_reaction_time_ms'],
                "created_at": item['created_at']
            })
        
        return Response(history)
from django.db.models import Avg, Max, Count, Sum
from django.db.models.functions import TruncDate

class StatsSummaryView(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        user_id = request.query_params.get('user_id')
        if not user_id:
            # Try to get from authenticated user
            if request.user.is_authenticated:
                user = request.user
            else:
                return Response({"error": "User ID is required"}, status=status.HTTP_400_BAD_REQUEST)
        else:
            user = get_object_or_404(User, id=user_id)

        sessions = TrainingSession.objects.filter(user=user)
        
        # General Stats
        stats = sessions.aggregate(
            avgReactionTime=Avg('average_reaction_time_ms'),
            bestScore=Max('score'),
            totalDrills=Count('id')
        )
        # Ensure default values if no sessions
        for key in stats:
            if stats[key] is None:
                stats[key] = 0

        # Timeseries Data
        timeseries_query = sessions.annotate(date=TruncDate('created_at')) \
            .values('date') \
            .annotate(totalScore=Sum('score'), totalTime=Count('id')) \
            .order_by('date')
        
        timeseries = {item['date'].strftime('%Y-%m-%d'): {
            "totalScore": item['totalScore'],
            "totalTime": item['totalTime']
        } for item in timeseries_query}

        return Response({
            "stats": stats,
            "timeseries": timeseries
        })
