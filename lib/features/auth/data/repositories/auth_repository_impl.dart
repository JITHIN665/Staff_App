import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<User> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.login(email, password);
        return userModel;
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
  Future<void> resetPassword(String email) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.resetPassword(email);
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
