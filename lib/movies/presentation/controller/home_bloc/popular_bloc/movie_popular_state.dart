import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MoviePopularStates {}

class MoviePopularLoadingState extends MoviePopularStates {}

class MoviePopularSuccessState extends MoviePopularStates {
  final List<Movie> movies;

  MoviePopularSuccessState({required this.movies});
}

class MoviePopularFailureState extends MoviePopularStates {
  final String errorMessage;

  MoviePopularFailureState({required this.errorMessage});
}
