import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });

  final String fullName;
  final String email;
  final String phone;
  final String password;

  @override
  List<Object?> get props => [fullName, email, phone, password];
}
