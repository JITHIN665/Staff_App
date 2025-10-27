import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/helpers/ui_helpers.dart';
import '../../../../shared/helpers/navigation_helpers.dart';
import '../../../../shared/widgets/common_app_bar.dart';
import '../../../../shared/widgets/detail_info_row.dart';
import '../../../../shared/widgets/notes_section.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../domain/entities/booking.dart';
import '../providers/booking_providers.dart';
import '../widgets/status_update_bottom_sheet.dart';

class BookingDetailsScreen extends ConsumerWidget {
  final String bookingId;

  const BookingDetailsScreen({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(bookingProvider);

    try {
      final booking = bookingState.bookings.firstWhere(
        (booking) => booking.id == bookingId,
      );

      return BookingDetailsContent(booking: booking);
    } catch (e) {
      return ErrorView(onBackPressed: () => NavigationHelpers.goBack(context));
    }
  }
}

class ErrorView extends StatelessWidget {
  final VoidCallback onBackPressed;

  const ErrorView({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        title: '予約詳細',
        showBackButton: true,
        onBackPressed: onBackPressed,
      ),
      body: const Center(child: Text('予約が見つかりませんでした')),
    );
  }
}

class BookingDetailsContent extends ConsumerWidget {
  final Booking booking;

  const BookingDetailsContent({super.key, required this.booking});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        title: '予約詳細',
        showBackButton: true,
        onBackPressed: () => NavigationHelpers.goBack(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (booking.companyName != null && booking.companyName!.isNotEmpty)
              DetailInfoRow(
                icon: Icons.business_outlined,
                label: '法人名',
                value: booking.companyName!,
              ),

            DetailInfoRow(
              icon: Icons.person_outline,
              label: '宿泊者名',
              value: booking.guestName,
            ),

            DetailInfoRow(
              icon: Icons.bed_outlined,
              label: '客室',
              value: booking.roomNumber,
            ),

            DetailInfoRow(
              icon: Icons.people_outline,
              label: '宿泊人数',
              value: '${booking.numberOfGuests}名',
            ),

            DetailInfoRow(
              icon: Icons.calendar_today_outlined,
              label: '宿泊期間',
              value: UIHelpers.formatDateRange(
                booking.checkIn,
                booking.checkOut,
              ),
            ),

            const SizedBox(height: 24),

            if (booking.notes != null && booking.notes!.isNotEmpty) ...[
              NotesSection(notes: booking.notes),
              const SizedBox(height: 32),
            ],

            CustomButton(
              text: 'チェックイン済みに変更する',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder:
                      (modalContext) => StatusUpdateBottomSheet(
                        currentStatus: booking.status,
                        onStatusSelected: (newStatus) {
                          ref
                              .read(bookingProvider.notifier)
                              .updateBookingStatus(booking.id, newStatus);
                        },
                      ),
                );
              },
              backgroundColor: const Color(0xFF00338D),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
