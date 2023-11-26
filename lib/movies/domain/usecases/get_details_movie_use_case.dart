import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/base_use_cases/base_use_case.dart';
import 'package:movie_app/core/utils/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/repository/movie_base_repository.dart';

class GetDetailsMovieUseCase
    extends BaseUseCase<MovieDetails, DetailsMovieUseCaseParamters> {
  final MovieBaseRepository movieBaseRepository;

  GetDetailsMovieUseCase({required this.movieBaseRepository});
  @override
  Future<Either<Failure, MovieDetails>> call(
      DetailsMovieUseCaseParamters paramters) async {
    return await movieBaseRepository.getDetailsMovie(
        movieId: paramters.movieId);
  }
}

class DetailsMovieUseCaseParamters {
  final int movieId;

  DetailsMovieUseCaseParamters({required this.movieId});
}
