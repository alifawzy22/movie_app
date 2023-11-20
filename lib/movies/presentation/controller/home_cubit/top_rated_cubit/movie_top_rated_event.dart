import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MovieTopRatedEvents {}

class MovieTopRatedLoadingEvent extends MovieTopRatedEvents {}

class MovieTopRatedSuccessEvent extends MovieTopRatedEvents {
  final List<Movie> movies;

  MovieTopRatedSuccessEvent({required this.movies});
}

class MovieTopRatedFailureEvent extends MovieTopRatedEvents {
  final String errorMessage;

  MovieTopRatedFailureEvent({required this.errorMessage});
}
