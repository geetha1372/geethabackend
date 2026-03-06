from rest_framework import serializers
from .models import Level

class LevelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Level
        fields = ['user', 'game_type', 'score', 'date_played']
        read_only_fields = ['date_played']