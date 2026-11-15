import 'package:equatable/equatable.dart';

/// Base class for every domain level failure.
sealed class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class ServerFailure extends Failure {
  const ServerFailure([super.message = 'حدث خطأ في الخادم، حاول مرة أخرى']);
}

final class CacheFailure extends Failure {
  const CacheFailure([super.message = 'تعذر تحميل البيانات']);
}
