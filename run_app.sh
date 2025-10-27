#!/bin/bash

echo "🚀 Starting Staff App Flutter Application..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    echo "Visit: https://flutter.dev/docs/get-started/install"
    exit 1
fi

# Check if JSON server is running
if ! curl -s http://localhost:3000/users > /dev/null; then
    echo "❌ JSON Server is not running. Please start it first:"
    echo "   ./start_server.sh"
    exit 1
fi

echo "✅ JSON Server is running"
echo "📱 Starting Flutter app..."

# Run Flutter app
flutter run
