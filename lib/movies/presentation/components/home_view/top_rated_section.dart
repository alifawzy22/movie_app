import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/custom_error_widget.dart';
import 'package:movie_app/core/utils/shimmer_widgets/popular_movie_shimmer.dart';
import 'package:movie_app/movies/presentation/components/home_view/top_rated_movie_list_view.dart';
import 'package:movie_app/movies/presentation/controller/home_bloc/top_rated_bloc/movie_top_rated_bloc.dart';
import 'package:movie_app/movies/presentation/controller/home_bloc/top_rated_bloc/movie_top_rated_event.dart';
import 'package:movie_app/movies/presentation/controller/home_bloc/top_rated_bloc/movie_top_rated_state.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieTopRatedBloc()..add(MovieTopRatedLoadingEvent()),
      child: BlocBuilder<MovieTopRatedBloc, MovieTopRatedStates>(
          builder: (context, state) {
        if (state is MovieTopRatedSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5.2,
              child: TopRatedMoviesListView(movies: state.movies),
            ),
          );
        } else if (state is MovieTopRatedFailureState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 5.2,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: CustomErrorWidget(errMessage: state.errorMessage),
            ),
          );
        } else {
          return const PopularMovieShimmer();
        }
      }),
    );
  }
}
