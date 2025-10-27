import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Font Family - Noto Sans JP (Free, professional Japanese font)
  static String get fontFamily => GoogleFonts.notoSansJp().fontFamily ?? 'Noto Sans JP';
  
  // Primary Colors (Blue theme from design)
  static const Color primaryColor = Color(0xFF002F7B);  // iOS Blue
  static const Color primaryDark = Color(0xFF002157);   // Dark Blue
  static const Color secondaryColor = Color(0xFF5AC8FA); // Light Blue
  
  // Status Colors
  static const Color statusPending = Color(0xFFFF9500);    // Orange
  static const Color statusReserved = Color(0xFFFF9500);   // Orange
  static const Color statusCheckedIn = Color(0xFFFF3B30);  // Red
  static const Color statusStaying = Color(0xFF007AFF);    // Blue
  static const Color statusCheckedOut = Color(0xFF8E8E93); // Grey
  static const Color statusCancelled = Color(0xFFFF3B30);  // Red
  
  // Background Colors
  static const Color backgroundColor = Color(0xFFF2F2F7);  // Light Grey Background
  static const Color surfaceColor = Color(0xFFFFFFFF);     // White
  static const Color cardBackground = Color(0xFFF4F6F8);   // White
  
  // Text Colors
  static const Color textPrimaryColor = Color(0xFF001434);    // Black
  static const Color textSecondaryColor = Color(0xFF5D5F62);  // Dark Grey
  static const Color textTertiaryColor = Color(0xFF999999);   // Grey
  static const Color textPlaceholder = Color(0xFFC7C7CC);     // Light Grey
  
  // Border & Divider Colors
  static const Color borderColor = Color(0xFFE5E5EA);     // Light Border
  static const Color dividerColor = Color(0xFFE5E5EA);    // Light Divider
  
  // Error & Success Colors
  static const Color errorColor = Color(0xFFFF3B30);      // Red
  static const Color successColor = Color(0xFF34C759);    // Green
  static const Color warningColor = Color(0xFFFF9500);    // Orange

  // ========== TEXT STYLES ==========
  
  // Headers (Large titles)
  static TextStyle heading1({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.5,
    );
  }

  static TextStyle heading2({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.5,
    );
  }

  static TextStyle heading3({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.3,
    );
  }

  // Titles
  static TextStyle title1({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.3,
    );
  }

  static TextStyle title2({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.2,
    );
  }

  static TextStyle title3({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.1,
    );
  }

  // Body text
  static TextStyle bodyLarge({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.2,
      height: 1.5,
    );
  }

  static TextStyle bodyMedium({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.1,
      height: 1.5,
    );
  }

  static TextStyle bodySmall({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? textSecondaryColor,
      letterSpacing: -0.1,
      height: 1.4,
    );
  }

  // Labels (for form labels, small text)
  static TextStyle labelLarge({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? textSecondaryColor,
      letterSpacing: -0.1,
    );
  }

  static TextStyle labelMedium({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? textSecondaryColor,
      letterSpacing: 0,
    );
  }

  static TextStyle labelSmall({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? textTertiaryColor,
      letterSpacing: 0,
    );
  }

  // Button text
  static TextStyle buttonLarge({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.white,
      letterSpacing: -0.2,
    );
  }

  static TextStyle buttonMedium({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? Colors.white,
      letterSpacing: -0.1,
    );
  }

  // Caption (very small text)
  static TextStyle caption({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? textTertiaryColor,
      letterSpacing: 0,
    );
  }

  static ThemeData get lightTheme {
    // Get Noto Sans JP text theme
    final baseTextTheme = GoogleFonts.notoSansJpTextTheme();
    
    return ThemeData(
      fontFamily: fontFamily,
      textTheme: baseTextTheme,
      useMaterial3: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
        surface: surfaceColor,
        background: backgroundColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryDark,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: TextStyle(
          fontFamily: fontFamily,
          color: textPlaceholder,
          fontSize: 16,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: cardBackground,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: textSecondaryColor,
        selectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
