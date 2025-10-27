import '../entities/booking.dart';

abstract class BookingRepository {
  Future<List<Booking>> getBookings({
    String? searchQuery,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<Booking> updateBookingStatus(String bookingId, BookingStatus status);
}
