import '../../../../core/error/result.dart';
import '../entities/register_params.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterDonorUseCase {
  const RegisterDonorUseCase(this._repository);

  final AuthRepository _repository;

  Future<Result<UserEntity>> call(RegisterParams params) =>
      _repository.registerDonor(params);
}
