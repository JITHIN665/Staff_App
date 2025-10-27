import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHelpers {
  // Navigation methods
  static void goToBookingDetails(BuildContext context, String bookingId) {
    context.go('/home/booking-details/$bookingId');
  }
  
  static void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
  
  static void goToLogin(BuildContext context) {
    context.go('/login');
  }
  
  static void goToHome(BuildContext context) {
    context.go('/home');
  }
  
  static void goToResetPassword(BuildContext context) {
    context.go('/reset-password');
  }

  static void goToPasswordResetConfirmation(BuildContext context, String email) {
    if (context.mounted) {
      context.go('/password-reset-confirmation?email=${Uri.encodeComponent(email)}');
    }
  }
}

class ScreenHelpers {
  // Show snackbar
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
  
  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
  
  // Show loading dialog
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  
  // Hide loading dialog
  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
  
  // Show confirmation dialog
  static Future<bool?> showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('確認'),
          ),
        ],
      ),
    );
  }
}
