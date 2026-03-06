import os
import sys

print("Setting up Django...")
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')

import django
django.setup()

from score.models import TrainingSession

print("Querying latest sessions...")
sessions = TrainingSession.objects.all().order_by('-id')[:10]
for s in sessions:
    print(f"Game: {s.game_name}, Score: {s.score}, Acc: {s.accuracy_percentage}, RxTime: {s.average_reaction_time_ms}, Attempts: {s.total_attempts}")
