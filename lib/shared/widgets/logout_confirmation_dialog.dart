import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutConfirmationDialog({
    super.key,
    required this.onConfirm,
  });

  static Future<void> show(BuildContext context, VoidCallback onConfirm) {
    return showDialog(
      context: context,
      builder: (context) => LogoutConfirmationDialog(onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'ログアウト',
        style: AppTheme.title1(),
      ),
      content: Text(
        '本当にログアウトしますか？',
        style: AppTheme.bodyMedium(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'キャンセル',
            style: AppTheme.buttonMedium(color: AppTheme.textSecondaryColor),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: Text(
            'ログアウト',
            style: AppTheme.buttonMedium(color: AppTheme.errorColor),
          ),
        ),
      ],
    );
  }
}

