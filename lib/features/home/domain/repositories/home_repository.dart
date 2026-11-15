import '../../../../core/error/result.dart';
import '../entities/category_entity.dart';
import '../entities/sponsorship_entity.dart';

abstract interface class HomeRepository {
  Future<Result<List<CategoryEntity>>> getCategories();
  Future<Result<List<SponsorshipEntity>>> getSponsorships();
}
