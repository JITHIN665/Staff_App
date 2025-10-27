import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasources/booking_remote_datasource.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BookingRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Booking>> getBookings({
    String? searchQuery,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final bookingModels = await remoteDataSource.getBookings(
          searchQuery: searchQuery,
          startDate: startDate,
          endDate: endDate,
        );
        return bookingModels;
      } on Failure {
        rethrow;
      } catch (e) {
        throw ServerFailure(message: e.toString());
      }
    } else {
      throw const NetworkFailure(message: 'No internet connection');
    }
  }

  @override
  Future<Booking> updateBookingStatus(String bookingId, BookingStatus status) async {
    if (await networkInfo.isConnected) {
      try {
        final bookingModel = await remoteDataSource.updateBookingStatus(
          bookingId,
          status.value,
        );
        return bookingModel;
      } on Failure {
        rethrow;
      } catch (e) {
        throw ServerFailure(message: e.toString());
      }
    } else {
      throw const NetworkFailure(message: 'No internet connection');
    }
  }
}
