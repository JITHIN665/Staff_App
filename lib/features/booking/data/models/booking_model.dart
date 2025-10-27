import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/booking.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel extends Booking {
  const BookingModel({
    required super.id,
    required super.roomNumber,
    required super.guestName,
    super.companyName,
    super.numberOfGuests = 1,
    required super.checkIn,
    required super.checkOut,
    required super.status,
    required super.totalAmount,
    super.guestEmail,
    super.guestPhone,
    super.specialRequests,
    super.notes,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  factory BookingModel.fromEntity(Booking booking) {
    return BookingModel(
      id: booking.id,
      roomNumber: booking.roomNumber,
      guestName: booking.guestName,
      companyName: booking.companyName,
      numberOfGuests: booking.numberOfGuests,
      checkIn: booking.checkIn,
      checkOut: booking.checkOut,
      status: booking.status,
      totalAmount: booking.totalAmount,
      guestEmail: booking.guestEmail,
      guestPhone: booking.guestPhone,
      specialRequests: booking.specialRequests,
      notes: booking.notes,
    );
  }
}