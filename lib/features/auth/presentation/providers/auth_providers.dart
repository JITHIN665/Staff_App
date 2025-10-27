import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/storage/local_storage_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

// Auth state
class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;
  final String? emailError;
  final String? passwordError;
  final bool isPasswordResetSent;
  final bool isInitialized;
  final String? resetEmail;
  final bool isLoginFormFilled;
  final bool isResetFormFilled;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.emailError,
    this.passwordError,
    this.isPasswordResetSent = false,
    this.isInitialized = false,
    this.resetEmail,
    this.isLoginFormFilled = false,
    this.isResetFormFilled = false,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
    String? emailError,
    String? passwordError,
    bool? isPasswordResetSent,
    bool? isInitialized,
    String? resetEmail,
    bool? isLoginFormFilled,
    bool? isResetFormFilled,
    bool clearUser = false,
  }) {
    return AuthState(
      user: clearUser ? null : (user ?? this.user),
      isLoading: isLoading ?? this.isLoading,
      error: error,
      emailError: emailError,
      passwordError: passwordError,
      isPasswordResetSent: isPasswordResetSent ?? this.isPasswordResetSent,
      isInitialized: isInitialized ?? this.isInitialized,
      resetEmail: resetEmail ?? this.resetEmail,
      isLoginFormFilled: isLoginFormFilled ?? this.isLoginFormFilled,
      isResetFormFilled: isResetFormFilled ?? this.isResetFormFilled,
    );
  }
}

// Auth notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  LocalStorageService _localStorage;

  AuthNotifier(this._authRepository, this._localStorage) : super(const AuthState());

  // Initialize auth state from local storage
  Future<void> initializeAuth() async {
    if (state.isInitialized) return;
    
    state = state.copyWith(isLoading: true);
    
    try {
      // Ensure we have a properly initialized local storage instance
      _localStorage = await LocalStorageService.getInstance();
      
      if (_localStorage.hasValidSession()) {
        final email = _localStorage.getUserEmail();
        final name = _localStorage.getUserName();
        
        if (email != null && name != null) {
          final user = User(
            id: '1', // You might want to store this in local storage too
            email: email,
            name: name,
          );
          
          state = state.copyWith(
            user: user,
            isLoading: false,
            isInitialized: true,
          );
        } else {
          await _localStorage.clearUserData();
          state = state.copyWith(
            isLoading: false,
            isInitialized: true,
          );
        }
      } else {
        state = state.copyWith(
          isLoading: false,
          isInitialized: true,
        );
      }
    } catch (e) {
      try {
        await _localStorage.clearUserData();
      } catch (clearError) {
        // Ignore clear errors during initialization
      }
      state = state.copyWith(
        isLoading: false,
        isInitialized: true,
        error: 'Failed to initialize authentication',
      );
    }
  }

  Future<bool> login(String email, String password) async {
    // Clear previous errors and validate
    clearFieldErrors();
    validateEmail(email.trim());
    validatePassword(password);
    
    // Check if form is valid
    if (!isFormValid()) {
      return false;
    }
    
    // Set loading state
    state = state.copyWith(
      isLoading: true, 
      error: null,
    );
    
    try {
      // Ensure local storage is initialized
      if (!_localStorage.isInitialized) {
        _localStorage = await LocalStorageService.getInstance();
      }
      
      final user = await _authRepository.login(email.trim(), password);
      
      // Save user data to local storage
      await _localStorage.saveUserInfo(
        email: user.email,
        name: user.name,
      );
      await _localStorage.saveAuthToken('dummy_token_${user.id}'); // Replace with actual token
      
      state = state.copyWith(
        user: user,
        isLoading: false,
        error: null,
      );
      return true;
    } on Failure catch (e) {
      String errorMessage;
      if (e.message.contains('email') || e.message.contains('Email')) {
        errorMessage = 'メールアドレスまたはパスワードが間違っています';
      } else if (e.message.contains('password') || e.message.contains('Password')) {
        errorMessage = 'メールアドレスまたはパスワードが間違っています';
      } else if (e.message.contains('account') || e.message.contains('suspended')) {
        errorMessage = 'あなたのアカウントは一時的に停止されています。ご不明な点がある場合は、hello@tomaru.com までお問い合わせください。';
      } else {
        errorMessage = 'ログインに失敗しました。もう一度お試しください。';
      }
      
      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'ログインに失敗しました。もう一度お試しください。',
      );
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    // Clear previous errors and validate
    clearFieldErrors();
    validateEmail(email.trim());
    
    // Check if email is valid
    if (state.emailError != null) {
      return false;
    }
    
    // Set loading state
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // Ensure local storage is initialized
      if (!_localStorage.isInitialized) {
        _localStorage = await LocalStorageService.getInstance();
      }
      
      await _authRepository.resetPassword(email.trim());
      state = state.copyWith(
        isLoading: false,
        isPasswordResetSent: true,
        resetEmail: email.trim(),
        error: null,
      );
      return true;
    } on Failure catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
      return false;
    }
  }

  Future<void> logout() async {
    // Ensure local storage is initialized
    if (!_localStorage.isInitialized) {
      _localStorage = await LocalStorageService.getInstance();
    }
    
    await _localStorage.clearUserData();
    state = const AuthState(isInitialized: true);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearLoadingState() {
    state = state.copyWith(isLoading: false);
  }

  void clearPasswordResetSent() {
    state = state.copyWith(
      isPasswordResetSent: false,
      resetEmail: null,
    );
  }

  void clearFieldErrors() {
    state = state.copyWith(
      emailError: null,
      passwordError: null,
      error: null,
    );
  }

  void validateEmail(String email) {
    if (email.isEmpty) {
      state = state.copyWith(emailError: 'メールアドレスを入力してください');
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      state = state.copyWith(emailError: '有効なメールアドレスを入力してください');
    } else {
      state = state.copyWith(emailError: null);
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      state = state.copyWith(passwordError: 'パスワードを入力してください');
    } else if (password.length < 6) {
      state = state.copyWith(passwordError: 'パスワードは6文字以上で入力してください');
    } else {
      state = state.copyWith(passwordError: null);
    }
  }

  bool isFormValid() {
    return state.emailError == null && state.passwordError == null;
  }

  // Check if login form is filled
  void checkLoginFormFilled(String email, String password) {
    final isFilled = email.trim().isNotEmpty && password.isNotEmpty;
    if (isFilled != state.isLoginFormFilled) {
      state = state.copyWith(isLoginFormFilled: isFilled);
    }
  }

  // Check if reset form is filled
  void checkResetFormFilled(String email) {
    final isFilled = email.trim().isNotEmpty;
    if (isFilled != state.isResetFormFilled) {
      state = state.copyWith(isResetFormFilled: isFilled);
    }
  }
}

// Local storage provider
final localStorageProvider = FutureProvider<LocalStorageService>((ref) async {
  return await LocalStorageService.getInstance();
});

// Auth provider - creates notifier synchronously
// The notifier will initialize local storage internally when needed
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  
  // Create a temporary instance that will be replaced after initialization
  final tempLocalStorage = LocalStorageService();
  
  return AuthNotifier(authRepository, tempLocalStorage);
});
