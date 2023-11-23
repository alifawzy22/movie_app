import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MovieNowPlayingEvents {}

class MovieNowPlayingLoadingEvent extends MovieNowPlayingEvents {}

class MovieNowPlayingSuccessEvent extends MovieNowPlayingEvents {
  final List<Movie> movies;

  MovieNowPlayingSuccessEvent({required this.movies});
}

class MovieNowPlayingFailureEvent extends MovieNowPlayingEvents {
  final String errorMessage;

  MovieNowPlayingFailureEvent({required this.errorMessage});
}
