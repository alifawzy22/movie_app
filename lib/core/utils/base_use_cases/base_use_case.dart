import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/error/failure.dart';

abstract class BaseUseCase<T, Paramters> {
  Future<Either<Failure, T>> call(Paramters paramters);
}
