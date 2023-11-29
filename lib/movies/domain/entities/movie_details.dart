import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/movie_genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String? backdropPath;
  final String title;
  final String releaseDate;
  final num voteAverage;
  final int runtime;
  final String overview;
  final List<MovieGenres> genres;

  const MovieDetails({
    required this.id,
    this.backdropPath,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.runtime,
    required this.overview,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        title,
        releaseDate,
        voteAverage,
        runtime,
        overview,
        genres,
      ];
}
