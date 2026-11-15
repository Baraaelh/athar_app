import '../../domain/entities/register_params.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> registerDonor(RegisterParams params);
}

/// Fake implementation until the backend API is ready.
/// Replace the body with a real HTTP call (e.g. Dio) – nothing else changes.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> registerDonor(RegisterParams params) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: params.fullName,
      email: params.email,
      phone: params.phone,
      accountType: AccountType.donor,
    );
  }
}
