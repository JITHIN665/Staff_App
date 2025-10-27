class AppConstants {
  // API Configuration
  // Use your machine's IP for emulator/device access, or 10.0.2.2 for Android emulator
  static const String baseUrl = 'http://192.168.31.143:3000';
  static const String apiVersion = '/api/v1';
  
  // API Endpoints
  static const String loginEndpoint = '/users';
  static const String passwordResetEndpoint = '/passwordResets';
  static const String bookingsEndpoint = '/bookings';
  
  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  
  // App Configuration
  static const int splashDuration = 2000; // 2 seconds
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  
  // Pagination
  static const int defaultPageSize = 20;
  
  // Date Formats
  static const String dateFormat = 'MMM dd, yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'MMM dd, yyyy HH:mm';
}
