import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/register_cubit.dart';
import '../../features/auth/presentation/pages/register_donor_page.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/main_shell/presentation/cubit/main_shell_cubit.dart';
import '../../features/main_shell/presentation/pages/main_shell_page.dart';
import '../../features/onboarding/presentation/pages/welcome_page.dart';
import '../di/injection.dart';
import 'routes.dart';

abstract final class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      Routes.registerDonor => BlocProvider(
          create: (_) => sl<RegisterCubit>(),
          child: const RegisterDonorPage(),
        ),
      Routes.main => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<MainShellCubit>()),
            BlocProvider(create: (_) => sl<HomeCubit>()..loadHome()),
          ],
          child: const MainShellPage(),
        ),
      _ => const WelcomePage(),
    };
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }
}
