import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../models/booking_model.dart';

abstract class BookingRemoteDataSource {
  Future<List<BookingModel>> getBookings({
    String? searchQuery,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<BookingModel> updateBookingStatus(String bookingId, String status);
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final Dio _dio;

  BookingRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<BookingModel>> getBookings({
    String? searchQuery,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      
      if (searchQuery != null && searchQuery.isNotEmpty) {
        queryParams['q'] = searchQuery;
      }

      final response = await _dio.get(
        AppConstants.bookingsEndpoint,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200 && response.data is List) {
        final List<dynamic> bookings = response.data;
        List<BookingModel> bookingModels = bookings
            .map((booking) => BookingModel.fromJson(booking))
            .toList();
        
        // Client-side date filtering (JSON server doesn't support date range queries)
        if (startDate != null || endDate != null) {
          bookingModels = bookingModels.where((booking) {
            final checkInDate = booking.checkIn;
            final checkOutDate = booking.checkOut;
            
            // Check if booking overlaps with the selected date range
            if (startDate != null && endDate != null) {
              // Booking must overlap with the selected date range
              return (checkInDate.isBefore(endDate) || checkInDate.isAtSameMomentAs(endDate)) &&
                     (checkOutDate.isAfter(startDate) || checkOutDate.isAtSameMomentAs(startDate));
            } else if (startDate != null) {
              // Booking must be on or after start date
              return checkOutDate.isAfter(startDate) || checkOutDate.isAtSameMomentAs(startDate);
            } else if (endDate != null) {
              // Booking must be on or before end date
              return checkInDate.isBefore(endDate) || checkInDate.isAtSameMomentAs(endDate);
            }
            return true;
          }).toList();
        }
        
        return bookingModels;
      } else {
        throw const ServerFailure(message: 'Failed to fetch bookings');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure(message: 'Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkFailure(message: 'No internet connection');
      } else {
        throw ServerFailure(message: e.message ?? 'Server error');
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<BookingModel> updateBookingStatus(String bookingId, String status) async {
    try {
      final response = await _dio.patch(
        '${AppConstants.bookingsEndpoint}/$bookingId',
        data: {'status': status},
      );

      if (response.statusCode == 200) {
        return BookingModel.fromJson(response.data);
      } else {
        throw const ServerFailure(message: 'Failed to update booking status');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure(message: 'Connection timeout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkFailure(message: 'No internet connection');
      } else {
        throw ServerFailure(message: e.message ?? 'Server error');
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
}
