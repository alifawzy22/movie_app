import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/error/failure.dart';

abstract class BaseUseCase<T> {
  Future<Either<Failure, T>> call();
}
