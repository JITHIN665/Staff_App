import 'package:flutter/material.dart';
import 'package:staff_app/shared/theme/app_theme.dart';
import '../../features/booking/domain/entities/booking.dart';
import '../helpers/ui_helpers.dart';
import 'booking_card.dart';
import 'empty_state_widget.dart';

class BookingsListView extends StatelessWidget {
  final List<Booking> bookings;
  final bool isLoading;
  final Function(String bookingId) onBookingTap;
  final Future<void> Function()? onRefresh;

  const BookingsListView({
    super.key,
    required this.bookings,
    required this.isLoading,
    required this.onBookingTap,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading && bookings.isEmpty) {
      return Container(
        color: AppTheme.dividerColor,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (bookings.isEmpty) {
      return Container(
        color: AppTheme.dividerColor,
        child: RefreshIndicator(
          onRefresh: onRefresh ?? () async {},
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const EmptyStateWidget(
                message: '予約が見つかりませんでした',
                icon: Icons.search_off,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      color: AppTheme.dividerColor,
      child: RefreshIndicator(
        onRefresh: onRefresh ?? () async {},
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: UIHelpers.defaultPadding),
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return BookingCard(
              booking: booking,
              onTap: () => onBookingTap(booking.id),
            );
          },
        ),
      ),
    );
  }
}

