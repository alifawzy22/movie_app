import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/movie_base_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void initServiceLocator() {
    /// MOVIE REPOSITORY
    sl.registerLazySingleton<MovieBaseRepository>(
        () => MovieRepository(baseMovieRemoteDataSource: sl()));

    /// MOVIE REMOTE DATASOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// NOW PLAYING MOVIE USECASE
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(baseRepository: sl()));

    /// POPULAR MOVIE USECASE
    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(baseRepository: sl()));

    /// TOP RATED MOVIE USECASE
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(baseRepository: sl()));
  }
}
