import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/custom_error_widget.dart';
import 'package:movie_app/core/utils/shimmer_widgets/popular_movie_shimmer.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_recommendation_use_case.dart';
import 'package:movie_app/movies/presentation/components/movie_details_view/movie_recommendations_success_body.dart';
import 'package:movie_app/movies/presentation/controller/recommendation_bloc/recommendation_bloc.dart';
import 'package:movie_app/movies/presentation/controller/recommendation_bloc/recommendation_event.dart';
import 'package:movie_app/movies/presentation/controller/recommendation_bloc/recommendation_state.dart';

class MovieRecommendationSection extends StatelessWidget {
  final int movieId;
  const MovieRecommendationSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieRecommendationBloc>(
      create: (context) => MovieRecommendationBloc(
        MovieRecommendationUseCaseParamters(movieId: movieId),
      )..add(MovieRecommendationLoadingEvent(
          movieRecommendationUseCaseParamters:
              MovieRecommendationUseCaseParamters(movieId: movieId))),
      child: BlocBuilder<MovieRecommendationBloc, MovieRecommendationState>(
        builder: (context, state) {
          if (state is MovieRecommendationFailureState) {
            return CustomErrorWidget(
              errMessage: state.errorMessage,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
            );
          } else if (state is MovieRecommendationSuccessState) {
            return MovieRecommendationSuccessBody(
              movieRecommendations: state.movieRecommendations,
            );
          } else {
            return const Column(
              children: [
                PopularMovieShimmer(),
                SizedBox(
                  height: 8,
                ),
                PopularMovieShimmer(),
              ],
            );
          }
        },
      ),
    );
  }
}
