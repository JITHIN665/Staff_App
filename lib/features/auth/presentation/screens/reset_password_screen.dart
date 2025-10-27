import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/helpers/navigation_helpers.dart';
import '../../../../shared/helpers/ui_helpers.dart';
import '../../../../shared/widgets/custom_input_field.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/common_app_bar.dart';
import '../../../../shared/theme/app_theme.dart';
import '../providers/auth_providers.dart';

class ResetPasswordScreen extends ConsumerWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        title: 'パスワード再設定',
        showBackButton: true,
        onBackPressed: () => NavigationHelpers.goToLogin(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Text(
              '現在使っているメールアドレスを入力してください。パスワード再設定用のメールをお送りします。',
              style: AppTheme.bodyLarge(),
            ),
            const SizedBox(height: 40),
            ResetPasswordForm(
              authState: authState,
              authNotifier: authNotifier,
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPasswordForm extends ConsumerStatefulWidget {
  final AuthState authState;
  final AuthNotifier authNotifier;

  const ResetPasswordForm({super.key, 
    required this.authState,
    required this.authNotifier,
  });

  @override
  ConsumerState<ResetPasswordForm> createState() => ResetPasswordFormState();
}

class ResetPasswordFormState extends ConsumerState<ResetPasswordForm> {
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(onFormChanged);
  }

  void onFormChanged() {
    widget.authNotifier.checkResetFormFilled(_emailController.text);
  }

  @override
  void dispose() {
    _emailController.removeListener(onFormChanged);
    _emailController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          label: 'メールアドレス',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          errorText: widget.authState.emailError,
        ),
        const SizedBox(height: 40),
        CustomButton(
          text: 'パスワード再設定用メールを送信',
          isLoading: widget.authState.isLoading,
          onPressed: widget.authState.isResetFormFilled
              ? () async {
                  final email = _emailController.text;
                  final success = await widget.authNotifier.resetPassword(email);

                  if (success && mounted) {
                    context.go('/password-reset-confirmation?email=${Uri.encodeComponent(email.trim())}');
                  }
                }
              : null,
          backgroundColor: UIHelpers.getButtonColor(
            isLoading: widget.authState.isLoading,
            isFormFilled: widget.authState.isResetFormFilled,
          ),
        ),
      ],
    );
  }
}