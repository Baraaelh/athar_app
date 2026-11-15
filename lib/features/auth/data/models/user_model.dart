import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.accountType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        fullName: json['full_name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        accountType: AccountType.values.byName(json['account_type'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'account_type': accountType.name,
      };
}
