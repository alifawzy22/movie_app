import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/services/services_locator.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/top_rated_cubit/movie_top_rated_event.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/top_rated_cubit/movie_top_rated_state.dart';

class MovieTopRatedBloc extends Bloc<MovieTopRatedEvents, MovieTopRatedStates> {
  MovieTopRatedBloc() : super(MovieTopRatedLoadingState()) {
    on<MovieTopRatedEvents>(_getTopRatedMovies);
  }

  Future<void> _getTopRatedMovies(event, emit) async {
    if (event is MovieTopRatedSuccessEvent) {
      emit(MovieTopRatedSuccessState(movies: event.movies));
    } else if (event is MovieTopRatedFailureEvent) {
      emit(MovieTopRatedFailureState(errorMessage: event.errorMessage));
    } else {
      final result = await (sl<GetTopRatedMoviesUseCase>())();
      result.fold(
          (failure) => emit(
              MovieTopRatedFailureState(errorMessage: failure.errorMessage)),
          (movies) => emit(MovieTopRatedSuccessState(movies: movies)));
    }
  }
}
