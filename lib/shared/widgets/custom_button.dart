import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final hasOutline = borderColor != null;
    final bgColor = backgroundColor ?? const Color(0xFF002F7B);
    final txtColor = textColor ?? Colors.white;

    return SizedBox(
      height: height ?? 50,
      width: width,
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          onTap: (isLoading || onPressed == null) ? null : onPressed,
          borderRadius: BorderRadius.circular(100),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            height: height ?? 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: hasOutline
                ? BoxDecoration(
                    border: Border.all(color: borderColor!, width: 1.5),
                    borderRadius: BorderRadius.circular(100),
                  )
                : null,
            child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(txtColor),
                    ),
                  )
                : Text(
                    text,
                    style: AppTheme.buttonLarge(
                      color: txtColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

