import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/providers/providers.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';

// Booking state
class BookingState {
  final List<Booking> bookings;
  final bool isLoading;
  final String? error;
  final String? searchQuery;
  final DateTime? startDate;
  final DateTime? endDate;

  const BookingState({
    this.bookings = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery,
    this.startDate,
    this.endDate,
  });

  BookingState copyWith({
    List<Booking>? bookings,
    bool? isLoading,
    String? error,
    String? searchQuery,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return BookingState(
      bookings: bookings ?? this.bookings,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}

// Booking notifier
class BookingNotifier extends StateNotifier<BookingState> {
  final BookingRepository _bookingRepository;

  BookingNotifier(this._bookingRepository) : super(const BookingState());

  Future<void> loadBookings({
    String? searchQuery,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final bookings = await _bookingRepository.getBookings(
        searchQuery: searchQuery,
        startDate: startDate,
        endDate: endDate,
      );
      state = state.copyWith(
        bookings: bookings,
        isLoading: false,
        error: null,
        searchQuery: searchQuery,
        startDate: startDate,
        endDate: endDate,
      );
    } on Failure catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
    }
  }

  Future<void> refreshBookings() async {
    await loadBookings(
      searchQuery: state.searchQuery,
      startDate: state.startDate,
      endDate: state.endDate,
    );
  }

  Future<void> updateBookingStatus(String bookingId, BookingStatus status) async {
    try {
      final updatedBooking = await _bookingRepository.updateBookingStatus(
        bookingId,
        status,
      );
      
      final updatedBookings = state.bookings.map((booking) {
        if (booking.id == bookingId) {
          return updatedBooking;
        }
        return booking;
      }).toList();
      
      state = state.copyWith(bookings: updatedBookings);
    } on Failure catch (e) {
      state = state.copyWith(error: e.message);
    } catch (e) {
      state = state.copyWith(error: 'An unexpected error occurred');
    }
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void setDateRange(DateTime? startDate, DateTime? endDate) {
    state = state.copyWith(startDate: startDate, endDate: endDate);
  }

  Future<void> filterByDate(DateTime? date) async {
    // If date is null, clear the filter
    if (date == null) {
      await loadBookings(
        searchQuery: state.searchQuery,
        startDate: null,
        endDate: null,
      );
      return;
    }

    // Filter by the selected date (same day)
    final startOfDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);
    
    await loadBookings(
      searchQuery: state.searchQuery,
      startDate: startOfDay,
      endDate: endOfDay,
    );
  }

  void clearDateFilter() {
    loadBookings(
      searchQuery: state.searchQuery,
      startDate: null,
      endDate: null,
    );
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Booking provider
final bookingProvider = StateNotifierProvider<BookingNotifier, BookingState>((ref) {
  final bookingRepository = ref.watch(bookingRepositoryProvider);
  return BookingNotifier(bookingRepository);
});
