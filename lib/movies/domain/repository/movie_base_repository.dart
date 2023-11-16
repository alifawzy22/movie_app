import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class MovieBaseRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
