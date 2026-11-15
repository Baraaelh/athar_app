import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/register_cubit.dart';
import '../widgets/donor_banner.dart';
import '../widgets/login_prompt.dart';
import '../widgets/register_form.dart';

class RegisterDonorPage extends StatelessWidget {
  const RegisterDonorPage({super.key});

  void _onStateChanged(BuildContext context, RegisterState state) {
    final messenger = ScaffoldMessenger.of(context);
    switch (state.status) {
      case RegisterStatus.success:
        messenger.showSnackBar(const SnackBar(content: Text(AppStrings.registerSuccess)));
        Navigator.pushNamedAndRemoveUntil(context, Routes.main, (_) => false);
      case RegisterStatus.failure:
        messenger.showSnackBar(SnackBar(content: Text(state.errorMessage ?? '')));
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: _onStateChanged,
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        appBar: AppBar(
          toolbarHeight: 72,
          title: Text(AppStrings.createDonorAccount, style: AppTextStyles.appBarTitle),
          leading: IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black),
          ),
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28, 24, 28, 16),
            child: Column(
              children: [
                const DonorBanner(),
                const SizedBox(height: 30),
                const RegisterForm(),
                const SizedBox(height: 16),
                LoginPrompt(
                  onLoginTap: () => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text(AppStrings.comingSoon))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
