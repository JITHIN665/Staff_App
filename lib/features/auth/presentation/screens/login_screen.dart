import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/helpers/navigation_helpers.dart';
import '../../../../shared/helpers/ui_helpers.dart';
import '../../../../shared/widgets/custom_input_field.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/theme/app_theme.dart';
import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    return LoginForm(authState: authState, authNotifier: authNotifier);
  }
}

class LoginForm extends ConsumerStatefulWidget {
  final AuthState authState;
  final AuthNotifier authNotifier;

  const LoginForm({super.key, required this.authState, required this.authNotifier});

  @override
  ConsumerState<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    // Ensure loading state is cleared when login screen is shown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.authState.isLoading) {
        widget.authNotifier.clearLoadingState();
      }
    });

    // Listen to text changes and notify the provider
    _emailController.addListener(onFormChanged);
    _passwordController.addListener(onFormChanged);
  }

  void onFormChanged() {
    // Let the notifier handle the logic
    widget.authNotifier.checkLoginFormFilled(
      _emailController.text,
      _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.removeListener(onFormChanged);
    _passwordController.removeListener(onFormChanged);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ログイン',
                style: AppTheme.heading2(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              CustomInputField(
                label: 'メールアドレス',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorText: widget.authState.emailError,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'パスワード',
                        style: AppTheme.bodyMedium(
                          color: AppTheme.textSecondaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            () => NavigationHelpers.goToResetPassword(context),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'パスワードを忘れた',
                          style: AppTheme.labelMedium(
                            color: AppTheme.textSecondaryColor,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomInputField(
                    label: '', 
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: _obscurePassword,
                    errorText: widget.authState.passwordError,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF666666),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'ログイン',
                isLoading: widget.authState.isLoading,
                onPressed:
                    widget.authState.isLoginFormFilled
                        ? () async {
                          final success = await widget.authNotifier.login(
                            _emailController.text,
                            _passwordController.text,
                          );

                          // Navigate to home only after successful login
                          if (success && mounted) {
                            context.go('/home');
                          }
                        }
                        : null,
                backgroundColor: UIHelpers.getButtonColor(
                  isLoading: widget.authState.isLoading,
                  isFormFilled: widget.authState.isLoginFormFilled,
                ),
              ),

              // Error Message
              if (widget.authState.error != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF5F5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFFFE0E0)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.authState.error!,
                          style: AppTheme.bodyMedium(
                            color: AppTheme.errorColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
