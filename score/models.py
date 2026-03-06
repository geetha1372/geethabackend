from django.db import models
from django.contrib.auth.models import User

class UserDifficulty(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='difficulty_settings')
    global_difficulty = models.CharField(max_length=20, default='Easy') # Easy, Medium, Hard
    adaptive_difficulty = models.BooleanField(default=True)
    
    # Per-drill overrides
    reaction_time = models.CharField(max_length=20, default='easy')
    color_match = models.CharField(max_length=20, default='easy')
    number_sequence = models.CharField(max_length=20, default='easy')
    random_target = models.CharField(max_length=20, default='easy')
    multi_object_tracking = models.CharField(max_length=20, default='easy')
    focus_hold = models.CharField(max_length=20, default='easy')
    peripheral_flash = models.CharField(max_length=20, default='easy')

    def __str__(self):
        return f"{self.user.username} - {self.global_difficulty}"

class TrainingSession(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='training_sessions')
    game_name = models.CharField(max_length=100)
    sport_name = models.CharField(max_length=100, default='Other')
    score = models.IntegerField()
    accuracy_percentage = models.FloatField(default=0.0)
    average_reaction_time_ms = models.FloatField(default=0.0)
    total_attempts = models.IntegerField(default=0)
    correct_hits = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.game_name} - {self.score}"
