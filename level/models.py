from django.db import models
from django.contrib.auth.models import User

class Level(models.Model):
    GAME_CHOICES = [
        # Reaction Time Drills
        ('speed_tap', 'Speed Tap'),
        ('hand_eye', 'Hand Eye Sync'),
        ('color_match', 'Color Match'),
        ('advanced_combo', 'Advanced Combo'),
        
        # Visual Focus Drills
        ('focus_hold', 'Focus Hold'),
        ('random_target', 'Random Target'),
        
        # Object Tracking Drills
        ('left_right', 'Left Right'),
        ('multi_object', 'Multi Object Tracking'),
        ('number_sequence', 'Number Sequence'),
        
        # Peripheral Vision
        ('peripheral_flash', 'Peripheral Flash'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='scores')
    game_type = models.CharField(max_length=50, choices=GAME_CHOICES)
    score = models.IntegerField()
    date_played = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.game_type}: {self.score}"