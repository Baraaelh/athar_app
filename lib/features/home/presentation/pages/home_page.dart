import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/home_cubit.dart';
import '../widgets/categories_row.dart';
import '../widgets/home_header.dart';
import '../widgets/home_hero.dart';
import '../widgets/home_search_field.dart';
import '../widgets/section_header.dart';
import '../widgets/sponsorships_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _comingSoon(BuildContext context) => ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text(AppStrings.comingSoon)));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child:
                    HomeHeader(onNotificationsTap: () => _comingSoon(context))),
            SliverToBoxAdapter(
              child: Container(
                color: AppColors.white,
                padding: const EdgeInsets.fromLTRB(28, 24, 28, 12),
                child: Column(
                  children: [
                    const HomeHero(),
                    const SizedBox(height: 22),
                    HomeSearchField(
                        onChanged: context.read<HomeCubit>().search),
                  ],
                ),
              ),
            ),
            ..._buildContent(context, state),
          ],
        );
      },
    );
  }

  List<Widget> _buildContent(BuildContext context, HomeState state) {
    return switch (state.status) {
      HomeStatus.loading => const [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
                child: CircularProgressIndicator(color: AppColors.primary)),
          ),
        ],
      HomeStatus.failure => [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.errorMessage ?? '', style: AppTextStyles.body),
                  TextButton(
                    onPressed: context.read<HomeCubit>().loadHome,
                    child: Text(AppStrings.retry, style: AppTextStyles.link),
                  ),
                ],
              ),
            ),
          ),
        ],
      HomeStatus.loaded => [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 12, 28, 30),
              child: CategoriesRow(categories: state.categories),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SectionHeader(
                title: AppStrings.sponsorships,
                onViewAll: () => _comingSoon(context),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: SponsorshipsList(
              sponsorships: state.visibleSponsorships,
              onSponsor: (_) => _comingSoon(context),
            ),
          ),
        ],
    };
  }
}
