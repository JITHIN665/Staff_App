import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/helpers/ui_helpers.dart';
import '../../../../shared/helpers/navigation_helpers.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/common_app_bar.dart';
import '../../../../shared/theme/app_theme.dart';

class PasswordResetConfirmationScreen extends ConsumerWidget {
  final String email;

  const PasswordResetConfirmationScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: 'パスワード再設定',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Text(
              'メールを送信しました',
              style: AppTheme.title1(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '${UIHelpers.maskEmail(email)} 宛にパスワード再設定用の',
              style: AppTheme.title3(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            Text(
              'メールをお送りしました。メールに記載されたURLをクリックしてください。',
              style: AppTheme.title3(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: 'ログイン画面に戻る',
              onPressed: () => NavigationHelpers.goToLogin(context),
            ),
          ],
        ),
      ),
    );
  }


}
