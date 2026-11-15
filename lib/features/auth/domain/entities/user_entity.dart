import 'package:equatable/equatable.dart';

enum AccountType { donor, organization }

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.accountType,
  });

  final String id;
  final String fullName;
  final String email;
  final String phone;
  final AccountType accountType;

  @override
  List<Object?> get props => [id, fullName, email, phone, accountType];
}
