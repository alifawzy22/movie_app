import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/services/services_locator.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_recommendation_use_case.dart';
import 'package:movie_app/movies/presentation/controller/recommendation_bloc/recommendation_event.dart';
import 'package:movie_app/movies/presentation/controller/recommendation_bloc/recommendation_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final MovieRecommendationUseCaseParamters movieRecommendationUseCaseParamters;
  MovieRecommendationBloc(this.movieRecommendationUseCaseParamters)
      : super(MovieRecommendationLoadingState(
            movieRecommendationUseCaseParamters:
                movieRecommendationUseCaseParamters)) {
    on<MovieRecommendationEvent>(_getMovieRecommendations);
  }

  Future<void> _getMovieRecommendations(event, emit) async {
    if (event is MovieRecommendationLoadingEvent) {
      final result = await GetMovieRecommendationUseCase(
          movieBaseRepository: sl())(movieRecommendationUseCaseParamters);

      result.fold(
          (failure) => emit(MovieRecommendationFailureState(
              errorMessage: failure.errorMessage)),
          (movies) => emit(
              MovieRecommendationSuccessState(movieRecommendations: movies)));
    } else if (event is MovieRecommendationFailureEvent) {
      return emit(
          MovieRecommendationFailureState(errorMessage: event.errorMessage));
    } else if (event is MovieRecommendationSuccessEvent) {
      return emit(MovieRecommendationSuccessState(
          movieRecommendations: event.movieRecommendations));
    }
  }
}
