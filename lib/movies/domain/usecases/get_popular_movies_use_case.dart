import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/base_use_cases/base_use_case.dart';
import 'package:movie_app/core/utils/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/movie_base_repository.dart';

class GetPopularMoviesUseCase
    implements BaseUseCase<List<Movie>, PopularMoviesUseCaseNoParameters> {
  final MovieBaseRepository baseRepository;

  GetPopularMoviesUseCase({required this.baseRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(
      PopularMoviesUseCaseNoParameters noParamters) async {
    return await baseRepository.getPopularMovies();
  }
}

class PopularMoviesUseCaseNoParameters {}
