import 'package:flutter/material.dart';
import 'package:staff_app/shared/widgets/status.dart';
import '../../features/booking/domain/entities/booking.dart';
import '../helpers/ui_helpers.dart';
import '../theme/app_theme.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;
  final VoidCallback onTap;

  const BookingCard({super.key, required this.booking, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final statusColor = UIHelpers.getStatusColor(booking.status);

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: statusColor, width: 4)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(UIHelpers.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(booking.guestName, style: AppTheme.title2(color: AppTheme.textSecondaryColor)),const Spacer(),
                  Status(status: booking.status, color: statusColor),
                ],
              ),
              const SizedBox(height: UIHelpers.smallPadding),

              Row(
                children: [
                  Text(booking.roomNumber, style: AppTheme.heading2(fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: AppTheme.textTertiaryColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    UIHelpers.formatDateRange(
                      booking.checkIn,
                      booking.checkOut,
                    ),
                    style: AppTheme.bodySmall(
                      color: AppTheme.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


