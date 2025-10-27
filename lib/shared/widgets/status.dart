import 'package:flutter/material.dart';
import 'package:staff_app/features/booking/domain/entities/booking.dart';
import 'package:staff_app/shared/helpers/ui_helpers.dart';
import 'package:staff_app/shared/theme/app_theme.dart';

class Status extends StatelessWidget {
  final BookingStatus status;
  final Color color;

  const Status({super.key, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: UIHelpers.smallPadding,
        vertical: 4,
      ),
      decoration: UIHelpers.statusBadgeDecoration(color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            status.displayName,
            style: AppTheme.labelMedium(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}