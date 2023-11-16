import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/error/failure.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    final Response response;
    try {
      response = await Dio().get(ApiConstance.nowPlayingMoviePath);
      return right(
        (response.data['results'] as List)
            .map(
              (e) => MovieModel.fromJson(e),
            )
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerException.fromDioException(e));
      } else {
        return left(
          ServerException(errorMessage: 'Opps,there was an error'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    final Response response;
    try {
      response = await Dio().get(ApiConstance.popularMoviePath);
      return right(
        (response.data['results'] as List)
            .map(
              (e) => MovieModel.fromJson(e),
            )
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerException.fromDioException(e));
      } else {
        return left(
          ServerException(errorMessage: 'Opps,there was an error'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    final Response response;
    try {
      response = await Dio().get(ApiConstance.topRatedMoviePath);
      return right(
        (response.data['results'] as List)
            .map(
              (e) => MovieModel.fromJson(e),
            )
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerException.fromDioException(e));
      } else {
        return left(
          ServerException(errorMessage: 'Opps,there was an error'),
        );
      }
    }
  }
}
