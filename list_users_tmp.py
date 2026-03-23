import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
django.setup()

from django.contrib.auth.models import User

users = User.objects.all()
print(f"Total Users: {len(users)}")
for u in users:
    print(f"ID: {u.id} | Username: {u.username} | Email: {u.email} | Is Active: {u.is_active}")
