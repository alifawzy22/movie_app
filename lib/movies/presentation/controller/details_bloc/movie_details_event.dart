import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie_use_case.dart';

abstract class MovieDetailsEvent {}

class MovieDetailsLoadingEvent extends MovieDetailsEvent {
  final DetailsMovieUseCaseParamters paramters;

  MovieDetailsLoadingEvent({required this.paramters});
}

class MovieDetailsFailureEvent extends MovieDetailsEvent {
  final String errorMessage;

  MovieDetailsFailureEvent({required this.errorMessage});
}

class MovieDetailsSuccessEvent extends MovieDetailsEvent {
  final MovieDetails movie;

  MovieDetailsSuccessEvent({required this.movie});
}
