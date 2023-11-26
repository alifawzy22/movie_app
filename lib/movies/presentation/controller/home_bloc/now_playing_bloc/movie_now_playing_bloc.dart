import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_bloc/now_playing_bloc/movie_now_playing_event.dart';
import 'package:movie_app/movies/presentation/controller/home_bloc/now_playing_bloc/movie_now_playing_state.dart';

import '../../../../../core/utils/services/services_locator.dart';
import '../../../../domain/usecases/get_now_playing_movies_use_case.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvents, MovieNowPlayingStates> {
  MovieNowPlayingBloc() : super(MovieNowPlayingLoadingState()) {
    on<MovieNowPlayingEvents>(_getNowPlayingMovies);
  }

  Future<void> _getNowPlayingMovies(event, emit) async {
    if (event is MovieNowPlayingSuccessEvent) {
      emit(MovieNowPlayingSuccessState(movies: event.movies));
    } else if (event is MovieNowPlayingFailureEvent) {
      emit(MovieNowPlayingFailureState(errorMessage: event.errorMessage));
    } else {
      final result = await (sl<GetNowPlayingMoviesUseCase>())(
          NowPlayingMoviesUseCaseNoParamters());
      result.fold(
          (failure) => emit(
              MovieNowPlayingFailureState(errorMessage: failure.errorMessage)),
          (movies) => emit(MovieNowPlayingSuccessState(movies: movies)));
    }
  }
}
