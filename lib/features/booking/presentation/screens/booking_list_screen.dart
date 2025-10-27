import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/helpers/ui_helpers.dart';
import '../../../../shared/helpers/navigation_helpers.dart';
import '../../../../shared/widgets/date_app_bar.dart';
import '../../../../shared/widgets/search_bar_widget.dart';
import '../../../../shared/widgets/bookings_list_view.dart';
import '../../../../shared/widgets/date_filter_bottom_sheet.dart';
import '../providers/booking_providers.dart';
import '../../domain/entities/booking.dart';

class BookingListScreen extends ConsumerWidget {
  const BookingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(bookingProvider);

    ref.listen<BookingState>(bookingProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: Colors.red),
        );
        ref.read(bookingProvider.notifier).clearError();
      }
    });

    return _BookingListContent(
      bookings: bookingState.bookings,
      isLoading: bookingState.isLoading,
    );
  }
}

class _BookingListContent extends ConsumerStatefulWidget {
  final List<Booking> bookings;
  final bool isLoading;

  const _BookingListContent({required this.bookings, required this.isLoading});

  @override
  ConsumerState<_BookingListContent> createState() =>
      _BookingListContentState();
}

class _BookingListContentState extends ConsumerState<_BookingListContent> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingProvider.notifier).loadBookings();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = UIHelpers.formatDate(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DateAppBar(
        date: formattedDate,
        onRestaurantPressed: () {},
        onCalendarPressed: () {
          final bookingState = ref.read(bookingProvider);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder:
                (context) => DateFilterBottomSheet(
                  initialDate: bookingState.startDate,
                  onDateSelected: (selectedDate) {
                    ref
                        .read(bookingProvider.notifier)
                        .filterByDate(selectedDate);
                  },
                ),
          );
        },
      ),
      body: Column(
        children: [
          SearchBarWidget(
            controller: _searchController,
            keyboardType: TextInputType.number,
            onChanged: (query) {
              final searchQuery = query.trim().isEmpty ? null : query.trim();
              ref
                  .read(bookingProvider.notifier)
                  .loadBookings(searchQuery: searchQuery);
            },
          ),
          Expanded(
            child: BookingsListView(
              bookings: widget.bookings,
              isLoading: widget.isLoading,
              onBookingTap: (bookingId) {
                NavigationHelpers.goToBookingDetails(context, bookingId);
              },
              onRefresh:
                  () => ref.read(bookingProvider.notifier).refreshBookings(),
            ),
          ),
        ],
      ),
    );
  }
}
