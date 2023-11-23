import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MovieNowPlayingStates {}

class MovieNowPlayingLoadingState extends MovieNowPlayingStates {}

class MovieNowPlayingSuccessState extends MovieNowPlayingStates {
  final List<Movie> movies;

  MovieNowPlayingSuccessState({required this.movies});
}

class MovieNowPlayingFailureState extends MovieNowPlayingStates {
  final String errorMessage;

  MovieNowPlayingFailureState({required this.errorMessage});
}
