import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_constance.dart';
import 'package:movie_app/core/utils/custom_error_widget.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/core/utils/shimmer_widgets/popular_movie_shimmer.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_recommendation_use_case.dart';
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
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8, right: 16.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 5,
                ),
                itemCount: state.movieRecommendations.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: ApiConstance.imageUrl(
                        path: state.movieRecommendations[index].backdropPath,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppConstance.noImage,
                        fit: BoxFit.fill,
                      ),
                      placeholder: (context, url) => Image.asset(
                        AppConstance.imageLoading,
                      ),
                      fit: BoxFit.fill,
                      fadeInDuration: const Duration(milliseconds: 500),
                    ),
                  );
                },
              ),
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
