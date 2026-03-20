from django.contrib.auth.models import User
from rest_framework import serializers
from .models import UserProfile # Ensure you import your model

# ... Keep your RegisterSerializer code here ...

class UserProfileUpdateSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(source='user.email', read_only=True)

    class Meta:
        model = UserProfile
        fields = [
            'full_name', 'email', 'age', 'gender', 
            'skill_level', 'dominant_hand', 'dominant_eye'
        ]

    def update(self, instance, validated_data):
        # This handles the "Save Changes" logic
        for attr, value in validated_data.items():
            setattr(instance, attr, value)
        instance.save()
        return instance

class RegisterSerializer(serializers.ModelSerializer):
    full_name = serializers.CharField(write_only=True)
    password = serializers.CharField(write_only=True)
    confirm_password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ('full_name', 'email', 'password', 'confirm_password')

    def validate(self, attrs):
        if attrs['password'] != attrs['confirm_password']:
            raise serializers.ValidationError("Passwords do not match.")
        if User.objects.filter(email=attrs['email']).exists() or User.objects.filter(username=attrs['email']).exists():
            raise serializers.ValidationError({"email": "A user with that email already exists."})
        return attrs

    def create(self, validated_data):
        # Split full name for Django's User model
        names = validated_data['full_name'].split(' ', 1)
        first_name = names[0]
        last_name = names[1] if len(names) > 1 else ""

        user = User.objects.create_user(
            username=validated_data['email'], # Use email as username
            email=validated_data['email'],
            password=validated_data['password'],
            first_name=first_name,
            last_name=last_name
        )
        return user