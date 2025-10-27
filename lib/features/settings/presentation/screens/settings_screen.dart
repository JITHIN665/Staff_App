import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/helpers/navigation_helpers.dart';
import '../../../../shared/widgets/common_app_bar.dart';
import '../../../../shared/widgets/user_info_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../../shared/widgets/setting_item_card.dart';
import '../../../../shared/widgets/logout_button.dart';
import '../../../../shared/widgets/logout_confirmation_dialog.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: '設定',
      ),
      body: _SettingsContent(
        userName: authState.user?.name,
        userEmail: authState.user?.email,
        isLoading: !authState.isInitialized,
      ),
    );
  }
}

class _SettingsContent extends ConsumerWidget {
  final String? userName;
  final String? userEmail;
  final bool isLoading;

  const _SettingsContent({
    required this.userName,
    required this.userEmail,
    required this.isLoading,
  });

  void _handleLogout(BuildContext context, WidgetRef ref) {
    LogoutConfirmationDialog.show(
      context,
      () async {
        await ref.read(authProvider.notifier).logout();
        if (context.mounted) {
          NavigationHelpers.goToLogin(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Information Card
          UserInfoCard(
            name: userName,
            email: userEmail,
            isLoading: isLoading,
          ),
          
          const SizedBox(height: 32),
          
          // App Settings Section
          const SectionHeader(title: 'アプリ設定'),
          const SizedBox(height: 16),
          
          SettingItemCard(
            icon: Icons.notifications_outlined,
            title: '通知設定',
            subtitle: 'プッシュ通知の設定',
            onTap: () {
              // TODO: Implement notification settings
            },
          ),
          
          const SizedBox(height: 12),
          
          SettingItemCard(
            icon: Icons.language_outlined,
            title: '言語設定',
            subtitle: 'アプリの言語を変更',
            onTap: () {
              // TODO: Implement language settings
            },
          ),
          
          const SizedBox(height: 12),
          
          SettingItemCard(
            icon: Icons.dark_mode_outlined,
            title: 'テーマ設定',
            subtitle: 'ダークモードの切り替え',
            onTap: () {
              // TODO: Implement theme settings
            },
          ),
          
          const SizedBox(height: 32),
          
          // Account Section
          const SectionHeader(title: 'アカウント'),
          const SizedBox(height: 16),
          
          LogoutButton(
            onPressed: () => _handleLogout(context, ref),
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
