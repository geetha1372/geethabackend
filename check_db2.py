import os
import sys

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
import django
django.setup()

from score.models import TrainingSession

sessions = TrainingSession.objects.all().order_by('-id')[:10]
with open('db_out.txt', 'w', encoding='utf-8') as f:
    for s in sessions:
        f.write(f"Game: {s.game_name}, Score: {s.score}, Acc: {s.accuracy_percentage}, RxTime: {s.average_reaction_time_ms}, Attempts: {s.total_attempts}\n")
