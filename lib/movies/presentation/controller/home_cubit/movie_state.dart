import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MovieState {}

class MovieNowPlayingLoadingState extends MovieState {}

class MovieNowPlayingSuccessState extends MovieState {
  final List<Movie> movies;

  MovieNowPlayingSuccessState({required this.movies});
}

class MovieNowPlayingFailureState extends MovieState {
  final String errorMessage;

  MovieNowPlayingFailureState({required this.errorMessage});
}

class MoviePopularLoadingState extends MovieState {}

class MoviePopularSuccessState extends MovieState {
  final List<Movie> movies;

  MoviePopularSuccessState({required this.movies});
}

class MoviePopularFailureState extends MovieState {
  final String errorMessage;

  MoviePopularFailureState({required this.errorMessage});
}

class MovieTopRatedLoadingState extends MovieState {}

class MovieTopRatedSuccessState extends MovieState {
  final List<Movie> movies;

  MovieTopRatedSuccessState({required this.movies});
}

class MovieTopRatedFailureState extends MovieState {
  final String errorMessage;

  MovieTopRatedFailureState({required this.errorMessage});
}
