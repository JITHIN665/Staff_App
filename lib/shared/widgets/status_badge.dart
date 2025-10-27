import 'package:flutter/material.dart';
import 'package:staff_app/shared/helpers/ui_helpers.dart';
import '../../features/booking/domain/entities/booking.dart';

class StatusBadge extends StatelessWidget {
  final BookingStatus status;
  final double? fontSize;

  const StatusBadge({
    super.key,
    required this.status,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: UIHelpers.getStatusColor(status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: UIHelpers.getStatusColor(status),
          width: 1,
        ),
      ),
      child: Text(
        status.displayName,
        style: TextStyle(
          color: UIHelpers.getStatusColor(status),
          fontSize: fontSize ?? 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  
}
