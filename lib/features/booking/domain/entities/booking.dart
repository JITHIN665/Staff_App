import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum BookingStatus {
  pending,
  reserved, // 予約済み
  currentlyStaying, // 滞在中
  checkedIn, // チェックイン済み
  checkedOut, // チェックアウト済み
  cancelled,
}

extension BookingStatusExtension on BookingStatus {
  String get displayName {
    switch (this) {
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.reserved:
        return '予約済み';
      case BookingStatus.currentlyStaying:
        return '滞在中';
      case BookingStatus.checkedIn:
        return 'チェックイン済み';
      case BookingStatus.checkedOut:
        return 'チェックアウト済み';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.reserved:
        return Colors.orange;
      case BookingStatus.currentlyStaying:
        return Colors.blue;
      case BookingStatus.checkedIn:
        return Colors.red;
      case BookingStatus.checkedOut:
        return Colors.grey;
      case BookingStatus.cancelled:
        return Colors.red;
    }
  }

  String get value {
    switch (this) {
      case BookingStatus.pending:
        return 'pending';
      case BookingStatus.reserved:
        return 'reserved';
      case BookingStatus.currentlyStaying:
        return 'currently_staying';
      case BookingStatus.checkedIn:
        return 'checked_in';
      case BookingStatus.checkedOut:
        return 'checked_out';
      case BookingStatus.cancelled:
        return 'cancelled';
    }
  }

  static BookingStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'pending':
        return BookingStatus.pending;
      case 'reserved':
        return BookingStatus.reserved;
      case 'currently_staying':
        return BookingStatus.currentlyStaying;
      case 'checked_in':
        return BookingStatus.checkedIn;
      case 'checked_out':
        return BookingStatus.checkedOut;
      case 'cancelled':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.pending;
    }
  }
}

class Booking extends Equatable {
  final String id;
  final String roomNumber;
  final String guestName;
  final String? companyName;
  final int numberOfGuests;
  final DateTime checkIn;
  final DateTime checkOut;
  final BookingStatus status;
  final double totalAmount;
  final String? guestEmail;
  final String? guestPhone;
  final String? specialRequests;
  final String? notes;

  const Booking({
    required this.id,
    required this.roomNumber,
    required this.guestName,
    this.companyName,
    this.numberOfGuests = 1,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.totalAmount,
    this.guestEmail,
    this.guestPhone,
    this.specialRequests,
    this.notes,
  });

  Booking copyWith({
    String? id,
    String? roomNumber,
    String? guestName,
    String? companyName,
    int? numberOfGuests,
    DateTime? checkIn,
    DateTime? checkOut,
    BookingStatus? status,
    double? totalAmount,
    String? guestEmail,
    String? guestPhone,
    String? specialRequests,
    String? notes,
  }) {
    return Booking(
      id: id ?? this.id,
      roomNumber: roomNumber ?? this.roomNumber,
      guestName: guestName ?? this.guestName,
      companyName: companyName ?? this.companyName,
      numberOfGuests: numberOfGuests ?? this.numberOfGuests,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      guestEmail: guestEmail ?? this.guestEmail,
      guestPhone: guestPhone ?? this.guestPhone,
      specialRequests: specialRequests ?? this.specialRequests,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
        id,
        roomNumber,
        guestName,
        companyName,
        numberOfGuests,
        checkIn,
        checkOut,
        status,
        totalAmount,
        guestEmail,
        guestPhone,
        specialRequests,
        notes,
      ];
}
