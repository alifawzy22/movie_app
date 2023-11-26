import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/base_use_cases/base_use_case.dart';
import 'package:movie_app/core/utils/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/movie_base_repository.dart';

class GetTopRatedMoviesUseCase
    implements BaseUseCase<List<Movie>, TopRatedMoviesUseCaseNoParamters> {
  final MovieBaseRepository baseRepository;

  GetTopRatedMoviesUseCase({required this.baseRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(
      TopRatedMoviesUseCaseNoParamters noParamters) async {
    return await baseRepository.getTopRatedMovies();
  }
}

class TopRatedMoviesUseCaseNoParamters {}
