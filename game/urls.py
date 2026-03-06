from django.urls import path
from . import views  # This imports the entire views.py file

urlpatterns = [
    # Authentication Routes
    path('register/', views.RegisterView.as_view(), name='register'),
    path('login/', views.LoginView.as_view(), name='login'),
    
    # Password Reset Flow
    path('forgot-password/', views.ForgotPasswordView.as_view(), name='forgot_password'),
    path('verify-otp/', views.VerifyOTPView.as_view(), name='verify_otp'),
    path('reset-password/', views.ResetPasswordView.as_view(), name='reset_password'),
    
    # Profile Routes
    # Note: user_id is passed in the URL for fetching profile data
    path('profile/<int:user_id>/', views.ProfileView.as_view(), name='profile'),
    
    # Note: The view class in your code is named UpdateProfileView
    path('update-profile/', views.UpdateProfileView.as_view(), name='update_profile'),
]