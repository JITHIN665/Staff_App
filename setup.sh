#!/bin/bash

echo "🚀 Setting up Staff App Flutter Project..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    echo "Visit: https://flutter.dev/docs/get-started/install"
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    echo "Visit: https://nodejs.org/"
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Prerequisites check passed!"

# Install Flutter dependencies
echo "📦 Installing Flutter dependencies..."
flutter pub get

if [ $? -ne 0 ]; then
    echo "❌ Failed to install Flutter dependencies"
    exit 1
fi

# Install JSON Server locally
echo "📦 Installing JSON Server..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install JSON Server"
    exit 1
fi

echo "✅ Dependencies installed successfully!"

# Create a start script
cat > start_server.sh << 'EOF'
#!/bin/bash
echo "🌐 Starting JSON Server on port 3000..."
npx json-server --watch db.json --port 3000
EOF

chmod +x start_server.sh

echo ""
echo "🎉 Setup completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Start the JSON server: ./start_server.sh"
echo "2. In another terminal, run: flutter run"
echo ""
echo "🔑 Demo credentials:"
echo "   Email: admin@staffapp.com"
echo "   Password: password123"
echo ""
echo "📱 The app will be available on your device/emulator"
