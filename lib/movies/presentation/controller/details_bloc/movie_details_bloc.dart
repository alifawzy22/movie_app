import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/services/services_locator.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie_use_case.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_event.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final DetailsMovieUseCaseParamters detailsMovieUseCaseParamters;
  MovieDetailsBloc(this.detailsMovieUseCaseParamters)
      : super(
            MovieDetailsLoadingState(paramters: detailsMovieUseCaseParamters)) {
    on<MovieDetailsEvent>(_getmovieDetails);
  }

  Future<void> _getmovieDetails(event, emit) async {
    if (event is MovieDetailsFailureEvent) {
      return emit(MovieDetailsFailureState(errorMessage: event.errorMessage));
    } else if (event is MovieDetailsSuccessEvent) {
      return emit(MovieDetailsSuccessState(movie: event.movie));
    } else if (event is MovieDetailsLoadingEvent) {
      final result = await GetDetailsMovieUseCase(movieBaseRepository: sl())
          .call(event.paramters);

      result.fold(
          (failure) => emit(
              MovieDetailsFailureState(errorMessage: failure.errorMessage)),
          (movie) => emit(MovieDetailsSuccessState(movie: movie)));
    }
  }
}
