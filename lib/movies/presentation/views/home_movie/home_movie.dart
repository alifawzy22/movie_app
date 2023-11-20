import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/now_playing_cubit/movie_now_playing_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/now_playing_cubit/movie_now_playing_event.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/popular_cubit/movie_popular_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/popular_cubit/movie_popular_event.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/top_rated_cubit/movie_top_rated_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/top_rated_cubit/movie_top_rated_event.dart';
import 'package:movie_app/movies/presentation/views/home_movie/widgets/now_playing_section.dart';

class HomeMovie extends StatelessWidget {
  const HomeMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                MovieNowPlayingBloc()..add(MovieNowPlayingLoadingEvent())),
        BlocProvider(
            create: (context) =>
                MoviePopularBloc()..add(MoviePopularLoadingEvent())),
        BlocProvider(
            create: (context) =>
                MovieTopRatedBloc()..add(MovieTopRatedLoadingEvent())),
      ],
      child: Scaffold(
        body: ListView(
          children: const [
            NowPlayingSection(),
          ],
        ),
      ),
    );
  }
}
