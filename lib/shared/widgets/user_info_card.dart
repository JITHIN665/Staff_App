import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../helpers/app_icons.dart';

class UserInfoCard extends StatelessWidget {
  final String? name;
  final String? email;
  final bool isLoading;

  const UserInfoCard({
    super.key,
    this.name,
    this.email,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ユーザー情報',
            style: AppTheme.heading3(),
          ),
          const SizedBox(height: 16),
          if (isLoading)
            Text(
              'ユーザー情報を読み込み中...',
              style: AppTheme.bodyMedium(color: AppTheme.textSecondaryColor),
            )
          else ...[
            if (name != null)
              _UserInfoRow(
                icon: AppIcons.userIcon(size: 20, color: AppTheme.textSecondaryColor),
                label: '名前',
                value: name!,
              ),
            if (name != null && email != null) const SizedBox(height: 12),
            if (email != null)
              _UserInfoRow(
                icon: AppIcons.idCardIcon(size: 20, color: AppTheme.textSecondaryColor),
                label: 'メールアドレス',
                value: email!,
              ),
          ],
        ],
      ),
    );
  }
}

class _UserInfoRow extends StatelessWidget {
  final Widget icon;
  final String label;
  final String value;

  const _UserInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: icon,
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: AppTheme.title2(),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: AppTheme.bodyLarge(),
          ),
        ),
      ],
    );
  }
}

