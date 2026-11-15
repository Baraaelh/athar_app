import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/sponsorship_entity.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_sponsorships_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getCategories, required this.getSponsorships})
      : super(const HomeState());

  final GetCategoriesUseCase getCategories;
  final GetSponsorshipsUseCase getSponsorships;

  Future<void> loadHome() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final (categories, sponsorships) =
        await (getCategories(), getSponsorships()).wait;

    if (categories case Error(:final failure)) {
      return emit(state.copyWith(
          status: HomeStatus.failure, errorMessage: failure.message));
    }
    if (sponsorships case Error(:final failure)) {
      return emit(state.copyWith(
          status: HomeStatus.failure, errorMessage: failure.message));
    }

    emit(state.copyWith(
      status: HomeStatus.loaded,
      categories: (categories as Success<List<CategoryEntity>>).data,
      sponsorships: (sponsorships as Success<List<SponsorshipEntity>>).data,
    ));
  }

  void search(String query) => emit(state.copyWith(query: query));
}
