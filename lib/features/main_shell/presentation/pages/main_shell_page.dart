import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../cubit/main_shell_cubit.dart';
import '../widgets/app_bottom_nav_bar.dart';

class MainShellPage extends StatelessWidget {
  const MainShellPage({super.key});

  static final List<Widget> _tabs = [
    const HomePage(),
    const _ComingSoonTab(),
    const _ComingSoonTab(),
    const _ComingSoonTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainShellCubit, int>(
      builder: (context, index) => Scaffold(
        body: IndexedStack(index: index, children: _tabs),
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: index,
          onTap: context.read<MainShellCubit>().selectTab,
        ),
      ),
    );
  }
}

class _ComingSoonTab extends StatelessWidget {
  const _ComingSoonTab();

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(AppStrings.comingSoon, style: AppTextStyles.title));
}
