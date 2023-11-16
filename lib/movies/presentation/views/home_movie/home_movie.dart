import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_state.dart';
import 'package:movie_app/movies/presentation/views/home_movie/widgets/now_playing_section.dart';

class HomeMovie extends StatelessWidget {
  const HomeMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          NowPlayingSection(),
        ],
      ),
    );
  }
}
