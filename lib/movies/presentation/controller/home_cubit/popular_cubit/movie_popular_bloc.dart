import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/popular_cubit/movie_popular_event.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/popular_cubit/movie_popular_state.dart';

import '../../../../../core/utils/services/services_locator.dart';

class MoviePopularBloc extends Bloc<MoviePopularEvents, MoviePopularStates> {
  MoviePopularBloc() : super(MoviePopularLoadingState()) {
    on<MoviePopularEvents>(_getPopularMovies);
  }

  Future<void> _getPopularMovies(event, emit) async {
    if (event is MoviePopularSuccessEvent) {
      emit(MoviePopularSuccessState(movies: event.movies));
    } else if (event is MoviePopularFailureEvent) {
      emit(MoviePopularFailureState(errorMessage: event.errorMessage));
    } else {
      final result = await (sl<GetPopularMoviesUseCase>())();
      result.fold(
          (failure) => emit(
              MoviePopularFailureState(errorMessage: failure.errorMessage)),
          (movies) => emit(MoviePopularSuccessState(movies: movies)));
    }
  }
}
