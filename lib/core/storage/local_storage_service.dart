import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _authTokenKey = 'auth_token';
  static const String _userEmailKey = 'user_email';
  static const String _userNameKey = 'user_name';
  static const String _isLoggedInKey = 'is_logged_in';

  static LocalStorageService? _instance;
  SharedPreferences? _prefs;

  LocalStorageService._();

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService._();
      _instance!._prefs = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  LocalStorageService();

  /// Auth token methods
  /// 
  /// 
  Future<void> saveAuthToken(String token) async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    await _prefs!.setString(_authTokenKey, token);
  }

  String? getAuthToken() {
    return _prefs?.getString(_authTokenKey);
  }

  Future<void> removeAuthToken() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    await _prefs!.remove(_authTokenKey);
  }

  /// User info methods
  /// 
  /// 
  Future<void> saveUserInfo({
    required String email,
    required String name,
  }) async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    await _prefs!.setString(_userEmailKey, email);
    await _prefs!.setString(_userNameKey, name);
    await _prefs!.setBool(_isLoggedInKey, true);
  }

  String? getUserEmail() {
    return _prefs?.getString(_userEmailKey);
  }

  String? getUserName() {
    return _prefs?.getString(_userNameKey);
  }

  bool isLoggedIn() {
    return _prefs?.getBool(_isLoggedInKey) ?? false;
  }

  /// Clear all user data
  /// 
  /// 
  Future<void> clearUserData() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    await _prefs!.remove(_authTokenKey);
    await _prefs!.remove(_userEmailKey);
    await _prefs!.remove(_userNameKey);
    await _prefs!.setBool(_isLoggedInKey, false);
  }

  /// Check if user has valid session
  /// 
  /// 
  bool hasValidSession() {
    final token = getAuthToken();
    final isLoggedIn = this.isLoggedIn();
    return token != null && token.isNotEmpty && isLoggedIn;
  }

  /// Check if local storage is initialized
  /// 
  /// 
  bool get isInitialized => _prefs != null;
}
