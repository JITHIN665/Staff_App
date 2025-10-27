import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/api_client.dart';
import '../network/network_info.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/booking/data/datasources/booking_remote_datasource.dart';
import '../../features/booking/data/repositories/booking_repository_impl.dart';

/// Core providers
/// 
/// 
final dioProvider = Provider<Dio>((ref) {
  ApiClient.init();
  return ApiClient.instance;
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl();
});

/// Auth providers
/// 
/// 
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSourceImpl(dio: dio);
});

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

/// Booking providers
/// 
/// 
final bookingRemoteDataSourceProvider = Provider<BookingRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return BookingRemoteDataSourceImpl(dio: dio);
});

final bookingRepositoryProvider = Provider<BookingRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(bookingRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return BookingRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});
