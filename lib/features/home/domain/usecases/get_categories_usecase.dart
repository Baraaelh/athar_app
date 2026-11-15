import '../../../../core/error/result.dart';
import '../entities/category_entity.dart';
import '../repositories/home_repository.dart';

class GetCategoriesUseCase {
  const GetCategoriesUseCase(this._repository);

  final HomeRepository _repository;

  Future<Result<List<CategoryEntity>>> call() => _repository.getCategories();
}
