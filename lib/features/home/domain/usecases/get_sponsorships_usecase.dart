import '../../../../core/error/result.dart';
import '../entities/sponsorship_entity.dart';
import '../repositories/home_repository.dart';

class GetSponsorshipsUseCase {
  const GetSponsorshipsUseCase(this._repository);

  final HomeRepository _repository;

  Future<Result<List<SponsorshipEntity>>> call() => _repository.getSponsorships();
}
