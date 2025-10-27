// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      id: json['id'] as String,
      roomNumber: json['roomNumber'] as String,
      guestName: json['guestName'] as String,
      companyName: json['companyName'] as String?,
      numberOfGuests: json['numberOfGuests'] as int? ?? 1,
      checkIn: DateTime.parse(json['checkIn'] as String),
      checkOut: DateTime.parse(json['checkOut'] as String),
      status: BookingStatusExtension.fromString(json['status'] as String),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      guestEmail: json['guestEmail'] as String?,
      guestPhone: json['guestPhone'] as String?,
      specialRequests: json['specialRequests'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomNumber': instance.roomNumber,
      'guestName': instance.guestName,
      'companyName': instance.companyName,
      'numberOfGuests': instance.numberOfGuests,
      'checkIn': instance.checkIn.toIso8601String(),
      'checkOut': instance.checkOut.toIso8601String(),
      'status': instance.status.value,
      'totalAmount': instance.totalAmount,
      'guestEmail': instance.guestEmail,
      'guestPhone': instance.guestPhone,
      'specialRequests': instance.specialRequests,
      'notes': instance.notes,
    };