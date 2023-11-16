import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/services/services_locator.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieNowPlayingLoadingState()) {
    on((event, emit) async {
      if (event is MovieNowPlayingSuccessEvent) {
        emit(MovieNowPlayingSuccessState(movies: event.movies));
      } else if (event is MovieNowPlayingFailureEvent) {
        emit(MovieNowPlayingFailureState(errorMessage: event.errorMessage));
      } else {
        final result =
            await GetNowPlayingMoviesUseCase(baseRepository: sl()).execute();
        result.fold(
            (failure) => emit(MovieNowPlayingFailureState(
                errorMessage: failure.errorMessage)),
            (movies) => emit(MovieNowPlayingSuccessState(movies: movies)));
      }
    });
  }
}
