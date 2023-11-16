import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/services/services_locator.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_event.dart';
import 'package:movie_app/movies/presentation/views/home_movie/home_movie.dart';

void main() {
  ServicesLocator().initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc()..add(MovieNowPlayingLoadingEvent()),
      child: MaterialApp(
        title: 'Movies',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeMovie(),
      ),
    );
  }
}
