import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/now_playing_cubit/movie_now_playing_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/now_playing_cubit/movie_now_playing_state.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: BlocBuilder<MovieNowPlayingBloc, MovieNowPlayingStates>(
        builder: (context, state) {
          if (state is MovieNowPlayingSuccessState) {
            return PageView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Image.network(
                  ApiConstance.imageUrl(path: state.movies[index].backdropPath),
                  fit: BoxFit.fill,
                );
              },
            );
          } else if (state is MovieNowPlayingFailureState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
