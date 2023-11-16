import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MovieEvent {}

class MovieNowPlayingLoadingEvent extends MovieEvent {}

class MovieNowPlayingSuccessEvent extends MovieEvent {
  final List<Movie> movies;

  MovieNowPlayingSuccessEvent({required this.movies});
}

class MovieNowPlayingFailureEvent extends MovieEvent {
  final String errorMessage;

  MovieNowPlayingFailureEvent({required this.errorMessage});
}

class MoviePopularLoadingEvent extends MovieEvent {}

class MoviePopularSuccessEvent extends MovieEvent {
  final List<Movie> movies;

  MoviePopularSuccessEvent({required this.movies});
}

class MoviePopularFailureEvent extends MovieEvent {
  final String errorMessage;

  MoviePopularFailureEvent({required this.errorMessage});
}

class MovieTopRatedLoadingEvent extends MovieEvent {}

class MovieTopRatedSuccessEvent extends MovieEvent {
  final List<Movie> movies;

  MovieTopRatedSuccessEvent({required this.movies});
}

class MovieTopRatedFailureEvent extends MovieEvent {
  final String errorMessage;

  MovieTopRatedFailureEvent({required this.errorMessage});
}
