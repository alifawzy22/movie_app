import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/base_use_cases/base_use_case.dart';
import 'package:movie_app/core/utils/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/repository/movie_base_repository.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<
    List<MovieRecommendation>, MovieRecommendationUseCaseParamters> {
  final MovieBaseRepository movieBaseRepository;

  GetMovieRecommendationUseCase({required this.movieBaseRepository});
  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(
      MovieRecommendationUseCaseParamters paramters) async {
    return await movieBaseRepository.getRecommendationMovie(
        movieId: paramters.movieId);
  }
}

class MovieRecommendationUseCaseParamters {
  final int movieId;

  MovieRecommendationUseCaseParamters({required this.movieId});
}
