import 'package:flutter/material.dart';

/// Helper class for custom app icons
/// All custom icons are stored in assets/icons/
class AppIcons {
  AppIcons._();

  // Icon paths
  static const String _basePath = 'assets/icons/';
  
  static const String bell = '${_basePath}bell.png';
  static const String building = '${_basePath}building.png';
  static const String calendar = '${_basePath}calendar.png';
  static const String calendarCheck = '${_basePath}calendarcheck.png';
  static const String doubleRoom = '${_basePath}double.png';
  static const String idCard = '${_basePath}IdCard.png';
  static const String logo = '${_basePath}logo.png';
  static const String pencil = '${_basePath}pencil.png';
  static const String search = '${_basePath}search.png';
  static const String settings = '${_basePath}settings.png';
  static const String user = '${_basePath}user.png';
  static const String utensils = '${_basePath}utensils.png';

  /// Helper method to create an Image widget from asset path
  static Widget icon(
    String assetPath, {
    double? size,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return Image.asset(
      assetPath,
      width: size,
      height: size,
      color: color,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        // Fallback to a default icon if image fails to load
        return Icon(
          Icons.image_not_supported,
          size: size,
          color: color ?? Colors.grey,
        );
      },
    );
  }

  /// Specific icon widgets for common use cases
  static Widget bellIcon({double size = 24, Color? color}) =>
      icon(bell, size: size, color: color);

  static Widget buildingIcon({double size = 24, Color? color}) =>
      icon(building, size: size, color: color);

  static Widget calendarIcon({double size = 24, Color? color}) =>
      icon(calendar, size: size, color: color);

  static Widget calendarCheckIcon({double size = 24, Color? color}) =>
      icon(calendarCheck, size: size, color: color);

  static Widget doubleRoomIcon({double size = 24, Color? color}) =>
      icon(doubleRoom, size: size, color: color);

  static Widget idCardIcon({double size = 24, Color? color}) =>
      icon(idCard, size: size, color: color);

  static Widget logoIcon({double size = 24, Color? color}) =>
      icon(logo, size: size, color: color);

  static Widget pencilIcon({double size = 24, Color? color}) =>
      icon(pencil, size: size, color: color);

  static Widget searchIcon({double size = 24, Color? color}) =>
      icon(search, size: size, color: color);

  static Widget settingsIcon({double size = 24, Color? color}) =>
      icon(settings, size: size, color: color);

  static Widget userIcon({double size = 24, Color? color}) =>
      icon(user, size: size, color: color);

  static Widget utensilsIcon({double size = 24, Color? color}) =>
      icon(utensils, size: size, color: color);
}

