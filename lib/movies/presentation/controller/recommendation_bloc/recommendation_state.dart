import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_recommendation_use_case.dart';

abstract class MovieRecommendationState {}

class MovieRecommendationLoadingState extends MovieRecommendationState {
  final MovieRecommendationUseCaseParamters movieRecommendationUseCaseParamters;

  MovieRecommendationLoadingState(
      {required this.movieRecommendationUseCaseParamters});
}

class MovieRecommendationFailureState extends MovieRecommendationState {
  final String errorMessage;

  MovieRecommendationFailureState({required this.errorMessage});
}

class MovieRecommendationSuccessState extends MovieRecommendationState {
  final List<MovieRecommendation> movieRecommendations;

  MovieRecommendationSuccessState({required this.movieRecommendations});
}
