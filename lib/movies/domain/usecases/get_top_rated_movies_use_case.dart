import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/movie_base_repository.dart';

class GetTopRatedMoviesUseCase {
  final MovieBaseRepository baseRepository;

  GetTopRatedMoviesUseCase({required this.baseRepository});

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseRepository.getTopRatedMovies();
  }
}
