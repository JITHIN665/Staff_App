import 'package:flutter/material.dart';
import '../../features/booking/domain/entities/booking.dart';
import '../theme/app_theme.dart';

class UIHelpers {
  static const Color primaryBlue = Color(0xFF00338D);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF666666);
  static const Color textGrey = Color(0xFF999999);
  
  static Color getButtonColor({
    required bool isLoading,
    required bool isFormFilled,
  }) {
    if (isLoading) {
      return AppTheme.primaryDark; 
    } else if (isFormFilled) {
      return AppTheme.primaryColor; 
    } else {
      return const Color(0xFFB0BFD6); 
    }
  }
  
  static Color getStatusColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return Color(0xffE58D12);
      case BookingStatus.reserved:
        return Color(0xffE58D12);
      case BookingStatus.currentlyStaying:
        return Color(0xff0045B3);
      case BookingStatus.checkedIn:
        return Color(0xffD10713);
      case BookingStatus.checkedOut:
        return Color(0xff5D5F62);
      case BookingStatus.cancelled:
        return Color(0xffD10713);
    }
  }


    static String maskEmail(String email) {
    if (email.isEmpty) return '';
    final parts = email.split('@');
    if (parts.length != 2) return email;
    
    final username = parts[0];
    final domain = parts[1];
    
    if (username.length <= 2) {
      return '${username[0]}*@$domain';
    }
    
    final maskedUsername = '${username[0]}${'*' * (username.length - 2)}${username[username.length - 1]}';
    return '$maskedUsername@$domain';
  }
  
  static String getStatusUpdateButtonText(BookingStatus status) {
    switch (status) {
      case BookingStatus.reserved:
        return 'チェックイン済みに変更する';
      case BookingStatus.checkedIn:
        return '滞在中に変更する';
      case BookingStatus.currentlyStaying:
        return 'チェックアウト済みに変更する';
      case BookingStatus.checkedOut:
        return '予約済みに変更する';
      default:
        return 'ステータスを更新する';
    }
  }
  
  static String formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }
  
  static String formatDateRange(DateTime checkIn, DateTime checkOut) {
    return '${formatDate(checkIn)} - ${formatDate(checkOut)}';
  }
  
  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  
  static const TextStyle labelTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
  
  static const TextStyle valueTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );
  
  static const TextStyle greyTextStyle = TextStyle(
    fontSize: 13,
    color: Colors.grey,
  );
  
  static const TextStyle smallGreyTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );
  
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryBlue,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.symmetric(vertical: 16),
  );
  
  static ButtonStyle get outlinedButtonStyle => OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  
  static InputDecoration searchInputDecoration({Widget? prefixIcon}) => InputDecoration(
    hintText: '客室名または名前で検索',
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.5),
    ),
  );
  
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );
  
  static BoxDecoration statusBadgeDecoration(Color color) => BoxDecoration(
    color: color.withOpacity(0.1),
    borderRadius: BorderRadius.circular(12),
  );
  
  static BoxDecoration get memoContainerDecoration => BoxDecoration(
    color: lightGrey,
    borderRadius: BorderRadius.circular(8),
  );
  
  // Spacing
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;
}
