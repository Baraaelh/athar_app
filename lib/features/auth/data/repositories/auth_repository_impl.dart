import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/register_params.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remote);

  final AuthRemoteDataSource _remote;

  @override
  Future<Result<UserEntity>> registerDonor(RegisterParams params) async {
    try {
      return Success(await _remote.registerDonor(params));
    } catch (_) {
      return const Error(ServerFailure());
    }
  }
}
