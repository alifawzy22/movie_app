import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/movie_state.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieNowPlayingSuccessState) {
            return PageView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    state.movies[index].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
