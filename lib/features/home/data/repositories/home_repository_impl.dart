import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/sponsorship_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._local);

  final HomeLocalDataSource _local;

  @override
  Future<Result<List<CategoryEntity>>> getCategories() =>
      _guard(_local.getCategories);

  @override
  Future<Result<List<SponsorshipEntity>>> getSponsorships() =>
      _guard(_local.getSponsorships);

  Future<Result<T>> _guard<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } catch (_) {
      return const Error(CacheFailure());
    }
  }
}
