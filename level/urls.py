from django.urls import path
from .views import SaveScoreView, DashboardScoresView

urlpatterns = [
    # Used when a user finishes a game
    path('save-score/', SaveScoreView.as_view(), name='save_score'),
    
    # Used to populate "Last Score" labels in your UI
    path('dashboard/<int:user_id>/', DashboardScoresView.as_view(), name='dashboard_scores'),
]