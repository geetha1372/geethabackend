from rest_framework import serializers
from .models import UserDifficulty

class UserDifficultySerializer(serializers.ModelSerializer):
    class Meta:
        model = UserDifficulty
        fields = [
            'user', 'global_difficulty', 'adaptive_difficulty',
            'reaction_time', 'color_match', 'number_sequence',
            'random_target', 'multi_object_tracking', 'focus_hold',
            'peripheral_flash'
        ]
        extra_kwargs = {'user': {'read_only': True}}

from .models import TrainingSession

class TrainingSessionSerializer(serializers.ModelSerializer):
    class Meta:
        model = TrainingSession
        fields = [
            'id', 'user', 'game_name', 'sport_name', 'score',
            'accuracy_percentage', 'average_reaction_time_ms',
            'total_attempts', 'correct_hits', 'created_at'
        ]
        extra_kwargs = {'user': {'read_only': True}}
