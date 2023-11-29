import 'package:movie_app/movies/data/models/movie_genres_model.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    super.backdropPath,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.runtime,
    required super.overview,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'] ?? '',
        title: json['title'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
        runtime: json['runtime'],
        overview: json['overview'],
        genres: List<MovieGenresModel>.from(
          (json['genres'] as List).map(
            (e) => MovieGenresModel.fromJson(e),
          ),
        ),
      );
}
