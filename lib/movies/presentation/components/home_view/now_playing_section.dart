import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/custom_error_widget.dart';
import 'package:movie_app/core/utils/shimmer_widgets/now_playing_movie_shimmer.dart';
import 'package:movie_app/movies/presentation/components/home_view/now_playing_movie_list_view.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/now_playing_cubit/movie_now_playing_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/now_playing_cubit/movie_now_playing_event.dart';
import 'package:movie_app/movies/presentation/controller/home_cubit/now_playing_cubit/movie_now_playing_state.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieNowPlayingBloc()..add(MovieNowPlayingLoadingEvent()),
      child: BlocBuilder<MovieNowPlayingBloc, MovieNowPlayingStates>(
        builder: (context, state) {
          if (state is MovieNowPlayingSuccessState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: NowPlayingMovieListView(movies: state.movies),
            );
          } else if (state is MovieNowPlayingFailureState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CustomErrorWidget(errMessage: state.errorMessage),
              ),
            );
          } else {
            return const NowPlayingMovieShimmer();
          }
        },
      ),
    );
  }
}
