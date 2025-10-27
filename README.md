# Staff App - Flutter Application

A complete Flutter application built with Riverpod state management and Clean Architecture, designed for staff management with booking functionality.

## Features

- **Authentication**: Login with email/password validation
- **Password Reset**: Forgot password functionality 
- **Booking Management**: View, search, and filter bookings
- **Booking Details**: Detailed view with status update capability
- **Settings**: User profile and logout functionality

## Architecture

This project follows Clean Architecture principles with:

- **Data Layer**: API services, repositories, and data models
- **Domain Layer**: Entities, repositories interfaces, and use cases
- **Presentation Layer**: UI screens, widgets, and state management with Riverpod




### Prerequisites

- Flutter SDK (3.x or higher)
- Dart SDK
- Node.js (for JSON server)
- Android Studio / VS Code

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd staff_app
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Install JSON Server locally**
   ```bash
   npm install
   ```

4. **Start the mock JSON server**
   ```bash
   ./start_server.sh
   ```

5. **Run the Flutter app** (in another terminal)
   ```bash
   ./run_app.sh
   ```
   
   Or manually:
   ```bash
   flutter run
   ```

### Demo Credentials

Use these credentials to test the app:

- **Email**: admin@staffapp.com
- **Password**: password123

- **Email**: staff@staffapp.com
- **Password**: password123

- **Email**: manager@staffapp.com
- **Password**: password123

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── providers/
│   └── router/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── booking/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── settings/
│   │   └── presentation/
│   └── splash/
│       └── presentation/
├── shared/
│   ├── constants/
│   ├── theme/
│   └── widgets/
└── main.dart
```


### Code Generation

Run code generation for JSON serialization:

```bash
flutter packages pub run build_runner build
```

### Linting

The project uses flutter_lints for code quality:

```bash
flutter analyze
```

# Staff_App
