import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MoviePopularEvents {}

class MoviePopularLoadingEvent extends MoviePopularEvents {}

class MoviePopularSuccessEvent extends MoviePopularEvents {
  final List<Movie> movies;

  MoviePopularSuccessEvent({required this.movies});
}

class MoviePopularFailureEvent extends MoviePopularEvents {
  final String errorMessage;

  MoviePopularFailureEvent({required this.errorMessage});
}
