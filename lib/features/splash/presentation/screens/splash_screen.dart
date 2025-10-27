import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../../shared/helpers/app_icons.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    // Delay initialization to avoid modifying provider during build
    Future.microtask(() => _initializeApp());
  }

  Future<void> _initializeApp() async {
    try {
      // Initialize authentication
      await ref.read(authProvider.notifier).initializeAuth();
      
      // Small delay for splash visibility
      await Future.delayed(const Duration(milliseconds: 1500));
      
      // Navigate only once
      if (mounted && !_hasNavigated) {
        _hasNavigated = true;
        final authState = ref.read(authProvider);
        
        // Navigate based on auth state
        if (authState.user != null) {
          context.go('/home');
        } else {
          context.go('/login');
        }
      }
    } catch (e) {
      // If initialization fails, go to login
      if (mounted && !_hasNavigated) {
        _hasNavigated = true;
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AppIcons.logoIcon(
          size: 80,
        ),
      ),
    );
  }
}
