import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie_use_case.dart';

abstract class MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {
  final DetailsMovieUseCaseParamters paramters;

  MovieDetailsLoadingState({required this.paramters});
}

class MovieDetailsFailureState extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsFailureState({required this.errorMessage});
}

class MovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetails movie;

  MovieDetailsSuccessState({required this.movie});
}
