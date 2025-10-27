import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/password_reset_confirmation_screen.dart';
import '../../features/booking/presentation/screens/home_screen.dart';
import '../../features/booking/presentation/screens/booking_details_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class AuthStateNotifier extends ChangeNotifier {
  AuthStateNotifier(this._ref) {
    _ref.listen<AuthState>(authProvider, (previous, next) {
      if (previous?.isInitialized != next.isInitialized ||
          (previous?.user != null && next.user == null)) {
        notifyListeners();
      }
    });
  }

  final Ref _ref;
}

final authStateNotifierProvider = Provider<AuthStateNotifier>((ref) {
  return AuthStateNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final authStateNotifier = ref.watch(authStateNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: authStateNotifier,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isLoggedIn = authState.user != null;
      final isInitialized = authState.isInitialized;
      final currentPath = state.uri.path;

      if (currentPath == '/splash') {
        return null;
      }

      if (currentPath == '/password-reset-confirmation') {
        return null;
      }

      if (currentPath == '/login' || currentPath == '/reset-password') {
        return null;
      }

      if (!isInitialized && currentPath != '/splash') {
        return '/splash';
      }

      if (!isLoggedIn && currentPath.startsWith('/home')) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/reset-password',
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: '/password-reset-confirmation',
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';
          return PasswordResetConfirmationScreen(email: email);
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'booking-details/:bookingId',
            builder: (context, state) {
              final bookingId = state.pathParameters['bookingId']!;
              return BookingDetailsScreen(bookingId: bookingId);
            },
          ),
        ],
      ),
    ],
  );
});
