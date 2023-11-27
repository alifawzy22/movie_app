import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_recommendation_use_case.dart';

abstract class MovieRecommendationEvent {}

class MovieRecommendationLoadingEvent extends MovieRecommendationEvent {
  final MovieRecommendationUseCaseParamters movieRecommendationUseCaseParamters;

  MovieRecommendationLoadingEvent(
      {required this.movieRecommendationUseCaseParamters});
}

class MovieRecommendationFailureEvent extends MovieRecommendationEvent {
  final String errorMessage;

  MovieRecommendationFailureEvent({required this.errorMessage});
}

class MovieRecommendationSuccessEvent extends MovieRecommendationEvent {
  final List<MovieRecommendation> movieRecommendations;

  MovieRecommendationSuccessEvent({required this.movieRecommendations});
}
