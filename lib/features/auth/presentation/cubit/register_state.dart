part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.isPasswordHidden = true,
    this.isConfirmPasswordHidden = true,
    this.errorMessage,
  });

  final RegisterStatus status;
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;
  final String? errorMessage;

  bool get isLoading => status == RegisterStatus.loading;

  RegisterState copyWith({
    RegisterStatus? status,
    bool? isPasswordHidden,
    bool? isConfirmPasswordHidden,
    String? errorMessage,
  }) =>
      RegisterState(
        status: status ?? this.status,
        isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
        isConfirmPasswordHidden:
            isConfirmPasswordHidden ?? this.isConfirmPasswordHidden,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props =>
      [status, isPasswordHidden, isConfirmPasswordHidden, errorMessage];
}
