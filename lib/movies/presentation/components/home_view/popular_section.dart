import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/custom_error_widget.dart';
import 'package:movie_app/core/utils/shimmer_widgets/popular_movie_shimmer.dart';
import 'package:movie_app/movies/presentation/components/home_view/popular_movie_list_view.dart';
import '../../controller/home_bloc/popular_bloc/movie_popular_bloc.dart';
import '../../controller/home_bloc/popular_bloc/movie_popular_event.dart';
import '../../controller/home_bloc/popular_bloc/movie_popular_state.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviePopularBloc()..add(MoviePopularLoadingEvent()),
      child: BlocBuilder<MoviePopularBloc, MoviePopularStates>(
          builder: (context, state) {
        if (state is MoviePopularSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5.2,
              child: PopularMoviesListView(movies: state.movies),
            ),
          );
        } else if (state is MoviePopularFailureState) {
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
