import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/error/failure.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/repository/movie_base_repository.dart';

class MovieRepository implements MovieBaseRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository({required this.baseMovieRemoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    return await baseMovieRemoteDataSource.getNowPlayingMovies();
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    return await baseMovieRemoteDataSource.getPopularMovies();
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    return await baseMovieRemoteDataSource.getTopRatedMovies();
  }

  @override
  Future<Either<Failure, MovieDetails>> getDetailsMovie(
      {required int movieId}) async {
    return await baseMovieRemoteDataSource.getDetailsMovie(movieId: movieId);
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getRecommendationMovie(
      {required int movieId}) async {
    return await baseMovieRemoteDataSource.getRecommendationMovies(
        movieId: movieId);
  }
}
