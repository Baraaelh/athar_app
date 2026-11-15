import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/register_params.dart';
import '../../domain/usecases/register_donor_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerDonor) : super(const RegisterState());

  final RegisterDonorUseCase _registerDonor;

  void togglePasswordVisibility() =>
      emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));

  void toggleConfirmPasswordVisibility() =>
      emit(state.copyWith(isConfirmPasswordHidden: !state.isConfirmPasswordHidden));

  Future<void> register(RegisterParams params) async {
    if (state.isLoading) return;
    emit(state.copyWith(status: RegisterStatus.loading));

    final result = await _registerDonor(params);

    result.when(
      success: (_) => emit(state.copyWith(status: RegisterStatus.success)),
      failure: (f) => emit(state.copyWith(status: RegisterStatus.failure, errorMessage: f.message)),
    );
  }
}
