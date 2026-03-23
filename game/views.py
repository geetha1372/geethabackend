import random
from django.shortcuts import get_object_or_404  # Required for ProfileView
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework.views import APIView
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from django.core.mail import send_mail
from django.conf import settings

# Import your models
from .serializers import RegisterSerializer
from .models import PasswordResetOTP, UserProfile

# --- REGISTRATION AND LOGIN ---

class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            # Automatically create profile on registration
            UserProfile.objects.get_or_create(user=user, full_name=request.data.get('full_name', ""))
            
            refresh = RefreshToken.for_user(user)
            return Response({
                "message": "User Created Successfully",
                "user_id": user.id,
                "refresh": str(refresh),
                "access": str(refresh.access_token),
            }, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class LoginView(generics.GenericAPIView):
    permission_classes = (AllowAny,)

    def post(self, request):
        email = request.data.get("email")
        password = request.data.get("password")
        
        # Find user by email first
        user_obj = User.objects.filter(email=email).first()
        if user_obj:
            user = authenticate(username=user_obj.username, password=password)
            if user is not None:
                refresh = RefreshToken.for_user(user)
                return Response({
                    "message": "Login successful",
                    "user_id": user.id,
                    "refresh": str(refresh),
                    "access": str(refresh.access_token),
                    "user": {
                        "email": user.email,
                        "username": user.username,
                        "id": user.id,
                        "full_name": UserProfile.objects.get_or_create(user=user)[0].full_name or f"{user.first_name} {user.last_name}".strip()
                    }
                }, status=status.HTTP_200_OK)
        
        return Response({"error": "Invalid email or password"}, status=status.HTTP_401_UNAUTHORIZED)

# --- FORGOT PASSWORD FLOW ---

class ForgotPasswordView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        email = request.data.get('email')
        if not User.objects.filter(email=email).exists():
            return Response({"error": "No user found with this email"}, status=status.HTTP_404_NOT_FOUND)

        otp = str(random.randint(100000, 999999))
        PasswordResetOTP.objects.update_or_create(
            email=email, 
            defaults={'otp': otp, 'is_verified': False}
        )

        subject = 'Your Password Reset OTP'
        message = f'Your OTP for resetting your password is: {otp}.'
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [email]

        try:
            send_mail(subject, message, email_from, recipient_list)
            return Response({"message": "OTP has been sent to your email"}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": f"Failed to send email: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class VerifyOTPView(APIView):
    permission_classes = (AllowAny,)

    def post(self, request):
        email = request.data.get('email')
        otp = request.data.get('otp')
        record = PasswordResetOTP.objects.filter(email=email, otp=otp).first()
        if record:
            record.is_verified = True
            record.save()
            return Response({"message": "OTP verified successfully"}, status=status.HTTP_200_OK)
        return Response({"error": "Invalid OTP"}, status=status.HTTP_400_BAD_REQUEST)

class ResetPasswordView(APIView):
    permission_classes = (AllowAny,)

    def post(self, request):
        email = request.data.get('email')
        new_password = request.data.get('new_password')
        confirm_password = request.data.get('confirm_password')

        record = PasswordResetOTP.objects.filter(email=email, is_verified=True).first()
        if not record:
            return Response({"error": "OTP not verified"}, status=status.HTTP_400_BAD_REQUEST)
        if new_password != confirm_password:
            return Response({"error": "Passwords do not match"}, status=status.HTTP_400_BAD_REQUEST)

        user = User.objects.get(email=email)
        user.set_password(new_password)
        user.save()
        record.delete() 
        return Response({"message": "Password updated successfully"}, status=status.HTTP_200_OK)

# --- PROFILE AND SETTINGS ---

class ProfileView(APIView):
    permission_classes = [AllowAny]

    def get(self, request, user_id):
        user = get_object_or_404(User, id=user_id)
        profile, _ = UserProfile.objects.get_or_create(user=user)
        
        # Localized imports to avoid circular dependency with 'score' app
        try:
            from score.models import UserDifficulty
            difficulty, _ = UserDifficulty.objects.get_or_create(user=user)
            difficulty_data = {
                "global_difficulty": difficulty.global_difficulty,
                "adaptive_difficulty": difficulty.adaptive_difficulty,
                "reaction_time": difficulty.reaction_time,
                "color_match": difficulty.color_match,
                "number_sequence": difficulty.number_sequence,
                "random_target": difficulty.random_target,
                "multi_object_tracking": difficulty.multi_object_tracking,
                "focus_hold": difficulty.focus_hold,
                "peripheral_flash": difficulty.peripheral_flash
            }
        except ImportError:
            difficulty_data = {}

        response_data = {
            "email": user.email,
            "username": user.username,
            "first_name": user.first_name,
            "last_name": user.last_name,
            "full_name": profile.full_name or f"{user.first_name} {user.last_name}".strip(),
            "age": profile.age,
            "gender": profile.gender,
            "skill_level": profile.skill_level,
            "dominant_hand": profile.dominant_hand,
            "dominant_eye": profile.dominant_eye,
            "sport_type": "Other",
            "profile_picture": request.build_absolute_uri(profile.profile_picture.url) if profile.profile_picture else None,
        }
        response_data.update(difficulty_data)
        
        return Response(response_data)

class UpdateProfileView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        user_id = request.data.get('user_id')
        user = get_object_or_404(User, id=user_id)
        profile, _ = UserProfile.objects.get_or_create(user=user)
        
        profile.full_name = request.data.get('full_name', profile.full_name)
        profile.age = request.data.get('age', profile.age)
        profile.gender = request.data.get('gender', profile.gender)
        profile.skill_level = request.data.get('skill_level', profile.skill_level)
        profile.dominant_hand = request.data.get('dominant_hand', profile.dominant_hand)
        profile.dominant_eye = request.data.get('dominant_eye', profile.dominant_eye)
        
        if 'profile_picture' in request.FILES:
            profile.profile_picture = request.FILES['profile_picture']
            
        profile.save()
        
        return Response({"message": "Profile updated successfully"})