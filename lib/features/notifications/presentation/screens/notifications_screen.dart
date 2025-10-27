import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/common_app_bar.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../../../shared/helpers/app_icons.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: '通知',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty notification icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: AppIcons.bellIcon(
                  size: 64,
                  color: Colors.grey[400],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Empty message
            Text(
              '通知はありません',
              style: AppTheme.title2(
                color: AppTheme.textSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            
            // Subtitle
            Text(
              '新しい通知が届くとここに表示されます',
              style: AppTheme.bodyMedium(
                color: AppTheme.textTertiaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
