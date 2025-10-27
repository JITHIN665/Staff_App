import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<void> resetPassword(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.get(
        AppConstants.loginEndpoint,
        queryParameters: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        final List<dynamic> users = response.data;
        if (users.isNotEmpty) {
          return UserModel.fromJson(users.first);
        } else {
          throw const AuthFailure(message: 'Invalid email or password');
        }
      } else {
        throw const AuthFailure(message: 'Login failed');
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
  Future<void> resetPassword(String email) async {
    try {
      await _dio.post(
        AppConstants.passwordResetEndpoint,
        data: {'email': email},
      );
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
