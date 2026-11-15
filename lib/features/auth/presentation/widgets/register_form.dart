import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/section_divider_title.dart';
import '../../domain/entities/register_params.dart';
import '../cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    context.read<RegisterCubit>().register(
          RegisterParams(
            fullName: _nameController.text.trim(),
            email: _emailController.text.trim(),
            phone: _phoneController.text.trim(),
            password: _passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 16);
    final cubit = context.read<RegisterCubit>();

    return Form(
      key: _formKey,
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) => Column(
          children: [
            const SectionDividerTitle(
              title: AppStrings.personalInfo,
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: 22),
            AppTextField(
              controller: _nameController,
              hint: AppStrings.fullName,
              prefixIcon: Icons.person_outline_rounded,
              validator: Validators.required,
            ),
            gap,
            AppTextField(
              controller: _emailController,
              hint: AppStrings.email,
              prefixIcon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
              validator: Validators.email,
            ),
            gap,
            AppTextField(
              controller: _phoneController,
              hint: AppStrings.phone,
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: Validators.phone,
            ),
            const SizedBox(height: 26),
            const SectionDividerTitle(
              title: AppStrings.passwordSection,
              icon: Icons.lock_outline_rounded,
            ),
            const SizedBox(height: 22),
            AppTextField(
              controller: _passwordController,
              hint: AppStrings.password,
              prefixIcon: Icons.lock_outline_rounded,
              obscureText: state.isPasswordHidden,
              onToggleObscure: cubit.togglePasswordVisibility,
              validator: Validators.password,
            ),
            gap,
            AppTextField(
              controller: _confirmController,
              hint: AppStrings.confirmPassword,
              prefixIcon: Icons.lock_outline_rounded,
              textInputAction: TextInputAction.done,
              obscureText: state.isConfirmPasswordHidden,
              onToggleObscure: cubit.toggleConfirmPasswordVisibility,
              validator: (v) =>
                  Validators.confirmPassword(v, _passwordController.text),
            ),
            const SizedBox(height: 34),
            PrimaryButton(
              label: AppStrings.createAccount,
              isLoading: state.isLoading,
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
