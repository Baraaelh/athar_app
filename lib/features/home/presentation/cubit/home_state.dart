part of 'home_cubit.dart';

enum HomeStatus { loading, loaded, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.categories = const [],
    this.sponsorships = const [],
    this.query = '',
    this.errorMessage,
  });

  final HomeStatus status;
  final List<CategoryEntity> categories;
  final List<SponsorshipEntity> sponsorships;
  final String query;
  final String? errorMessage;

  /// Sponsorships filtered by the current search query.
  List<SponsorshipEntity> get visibleSponsorships {
    final q = query.trim();
    if (q.isEmpty) return sponsorships;
    return sponsorships
        .where((s) => s.title.contains(q) || s.description.contains(q))
        .toList();
  }

  HomeState copyWith({
    HomeStatus? status,
    List<CategoryEntity>? categories,
    List<SponsorshipEntity>? sponsorships,
    String? query,
    String? errorMessage,
  }) =>
      HomeState(
        status: status ?? this.status,
        categories: categories ?? this.categories,
        sponsorships: sponsorships ?? this.sponsorships,
        query: query ?? this.query,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props =>
      [status, categories, sponsorships, query, errorMessage];
}
