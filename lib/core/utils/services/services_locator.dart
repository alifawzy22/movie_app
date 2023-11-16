import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/movie_base_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void initServiceLocator() {
    sl.registerLazySingleton<MovieBaseRepository>(
        () => MovieRepository(baseMovieRemoteDataSource: sl()));

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(baseRepository: sl()));
  }
}
