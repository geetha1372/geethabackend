from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Level
from .serializers import LevelSerializer
from django.contrib.auth.models import User

class SaveScoreView(APIView):
    """Saves a new score for a specific game drill."""
    def post(self, request):
        serializer = LevelSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class DashboardScoresView(APIView):
    """Returns the latest score for every game type for a specific user."""
    def get(self, request, user_id):
        game_types = [
            'speed_tap', 'hand_eye', 'color_match', 'advanced_combo',
            'focus_hold', 'random_target', 'left_right', 
            'multi_object', 'number_sequence', 'peripheral_flash'
        ]
        
        last_scores = {}
        for game in game_types:
            latest = Level.objects.filter(user_id=user_id, game_type=game).order_by('-date_played').first()
            last_scores[game] = latest.score if latest else 0
            
        return Response(last_scores)