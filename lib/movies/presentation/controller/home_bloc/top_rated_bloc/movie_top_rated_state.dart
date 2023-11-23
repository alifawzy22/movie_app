import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MovieTopRatedStates {}

class MovieTopRatedLoadingState extends MovieTopRatedStates {}

class MovieTopRatedSuccessState extends MovieTopRatedStates {
  final List<Movie> movies;

  MovieTopRatedSuccessState({required this.movies});
}

class MovieTopRatedFailureState extends MovieTopRatedStates {
  final String errorMessage;

  MovieTopRatedFailureState({required this.errorMessage});
}
