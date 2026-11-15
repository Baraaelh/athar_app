import '../../../../core/error/result.dart';
import '../entities/register_params.dart';
import '../entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<Result<UserEntity>> registerDonor(RegisterParams params);
}
