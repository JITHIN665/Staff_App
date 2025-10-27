# Staff App - Complete Flutter Project

## 🎯 Project Overview

This is a complete Flutter application built with **Riverpod state management** and **Clean Architecture** principles. The app is designed for staff management with comprehensive booking functionality.

## 🏗️ Architecture

### Clean Architecture Layers

```
📁 lib/
├── 🎯 core/                    # Core functionality
│   ├── constants/              # App constants
│   ├── errors/                 # Error handling
│   ├── network/                # API client
│   ├── providers/              # Core providers
│   ├── router/                 # Navigation
│   └── utils/                  # Utilities
├── 🎯 features/                # Feature modules
│   ├── auth/                   # Authentication
│   │   ├── data/              # Data layer
│   │   ├── domain/            # Business logic
│   │   └── presentation/      # UI layer
│   ├── booking/               # Booking management
│   │   ├── data/              # Data layer
│   │   ├── domain/            # Business logic
│   │   └── presentation/      # UI layer
│   ├── settings/              # Settings
│   └── splash/                # Splash screen
├── 🎯 shared/                  # Shared components
│   ├── constants/             # Shared constants
│   ├── theme/                 # App theme
│   └── widgets/               # Reusable widgets
└── main.dart                  # App entry point
```

## 🚀 Features Implemented

### ✅ Authentication System
- **Login Screen**: Email/password validation with error handling
- **Reset Password**: Email-based password reset simulation
- **State Management**: Riverpod providers for auth state

### ✅ Booking Management
- **Booking List**: Search and filter functionality
- **Date Filtering**: Range-based date selection
- **Status Management**: Real-time status updates
- **Pull-to-Refresh**: Data refresh capability

### ✅ User Interface
- **Modern Design**: Material Design 3 implementation
- **Responsive Layout**: Adaptive to different screen sizes
- **Custom Components**: Reusable UI components
- **Loading States**: Proper loading indicators
- **Error Handling**: User-friendly error messages

### ✅ Navigation
- **GoRouter**: Declarative routing
- **Bottom Navigation**: Tab-based navigation
- **Deep Linking**: Support for deep navigation
- **Route Guards**: Authentication-based routing

## 🛠️ Technical Stack

| Category | Technology | Version |
|----------|------------|---------|
| **Framework** | Flutter | 3.x+ |
| **Language** | Dart | 3.x+ |
| **State Management** | Riverpod | 2.4.9 |
| **Navigation** | GoRouter | 12.1.3 |
| **HTTP Client** | Dio | 5.4.0 |
| **Architecture** | Clean Architecture | - |
| **UI** | Material Design 3 | - |

## 📱 Screens Implemented

### 1. Splash Screen
- App logo and branding
- 2-second delay before navigation
- Smooth animations

### 2. Login Screen
- Email/password input validation
- Demo credentials display
- Error handling and loading states
- Navigation to reset password

### 3. Reset Password Screen
- Email input validation
- Success confirmation
- Back to login navigation

### 4. Home Screen (Bottom Navigation)
- **Bookings Tab**: Booking list with search/filter
- **Settings Tab**: User profile and app settings

### 5. Booking List Screen
- Search by room number or guest name
- Date range filtering
- Status-based filtering
- Pull-to-refresh functionality
- Booking cards with status badges

### 6. Booking Details Screen
- Complete booking information
- Guest details and contact info
- Payment information
- Status update via bottom sheet
- Special requests and notes

### 7. Settings Screen
- User profile information
- App version and build details
- Logout functionality
- Demo information display

## 🔧 Setup Instructions

### Prerequisites
- Flutter SDK (3.x or higher)
- Dart SDK
- Node.js and npm
- Android Studio / VS Code

### Quick Start
```bash
# 1. Clone and navigate to project
cd staff_app

# 2. Run setup script
chmod +x setup.sh
./setup.sh

# 3. Start JSON server (Terminal 1)
./start_server.sh

# 4. Run Flutter app (Terminal 2)
flutter run
```

### Manual Setup
```bash
# Install Flutter dependencies
flutter pub get

# Install JSON Server globally
npm install -g json-server

# Start mock server
json-server --watch db.json --port 3000

# Run Flutter app
flutter run
```

## 🔑 Demo Credentials

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@staffapp.com | password123 |
| Staff | staff@staffapp.com | password123 |
| Manager | manager@staffapp.com | password123 |

## 📊 API Endpoints

The app uses a mock JSON server with these endpoints:

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/users?email=&password=` | User authentication |
| POST | `/passwordResets` | Password reset request |
| GET | `/bookings` | Get bookings (supports search/filter) |
| PATCH | `/bookings/{id}` | Update booking status |

## 🎨 UI Components

### Custom Widgets
- **PrimaryButton**: Consistent button styling
- **CustomTextField**: Form input with validation
- **StatusBadge**: Booking status display
- **BookingCard**: Booking list item

### Theme System
- **Colors**: Primary, secondary, accent colors
- **Typography**: Consistent text styles
- **Spacing**: Standardized margins and padding
- **Shadows**: Material Design elevation

## 🔒 State Management

### Riverpod Providers
- **authProvider**: Authentication state
- **bookingProvider**: Booking data and operations
- **Core Providers**: Network, repositories, etc.

### State Classes
- **AuthState**: User, loading, error states
- **BookingState**: Bookings list, filters, loading

## 🧪 Testing

### Test Structure
- **Unit Tests**: Business logic testing
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end testing

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

## 📦 Dependencies

### Main Dependencies
```yaml
dependencies:
  flutter_riverpod: ^2.4.9
  go_router: ^12.1.3
  dio: ^5.4.0
  intl: ^0.19.0
  equatable: ^2.0.5
  json_annotation: ^4.8.1
```

### Dev Dependencies
```yaml
dev_dependencies:
  build_runner: ^2.4.7
  json_serializable: ^6.7.1
  flutter_lints: ^5.0.0
```

## 🚀 Deployment

### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release
```

### iOS
```bash
# Build iOS app
flutter build ios --release
```

## 🔧 Development

### Code Generation
```bash
# Generate JSON serialization code
flutter packages pub run build_runner build

# Watch for changes
flutter packages pub run build_runner watch
```

### Linting
```bash
# Analyze code
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

## 📈 Performance

### Optimizations
- **Lazy Loading**: Efficient data loading
- **State Management**: Minimal rebuilds
- **Image Caching**: Cached network images
- **Memory Management**: Proper disposal

### Best Practices
- Clean Architecture separation
- Immutable state objects
- Error boundary handling
- Responsive design

## 🐛 Troubleshooting

### Common Issues
1. **Flutter not found**: Install Flutter SDK
2. **Dependencies issues**: Run `flutter pub get`
3. **JSON Server not starting**: Check Node.js installation
4. **Build errors**: Check Flutter version compatibility

### Debug Mode
```bash
# Run in debug mode
flutter run --debug

# Run with verbose logging
flutter run --verbose
```

## 📝 License

This project is for demonstration purposes. Please ensure you have the necessary licenses for production use.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📞 Support

For questions or issues:
- Create an issue in the repository
- Contact the development team
- Check the documentation

---

**🎉 The Staff App is now complete and ready to run!**
