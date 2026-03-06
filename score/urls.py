from django.urls import path
from .views import (
    DifficultySettingsView, AddTrainingSessionView, 
    GameScoresView, SessionHistoryView
)

# IMPORT from the 'level' app specifically
from level.views import SaveScoreView, DashboardScoresView

urlpatterns = [
    path('difficulty/<int:user_id>/', DifficultySettingsView.as_view(), name='get_difficulty'),
    path('update_difficulty/', DifficultySettingsView.as_view(), name='update_difficulty'),
    path('add_training_session/', AddTrainingSessionView.as_view(), name='add_training_session'),
    path('game_scores/<int:user_id>/', GameScoresView.as_view(), name='game_scores'),
    path('session_history/<int:user_id>/', SessionHistoryView.as_view(), name='session_history'),

    # New routes pointing to the code inside the 'level' folder
    path('save-score/', SaveScoreView.as_view(), name='save_score'),
    path('dashboard/<int:user_id>/', DashboardScoresView.as_view(), name='dashboard_scores'),
]
