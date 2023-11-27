import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_constance.dart';
import 'package:movie_app/core/utils/custom_error_widget.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/core/utils/shimmer_widgets/now_playing_movie_shimmer.dart';
import 'package:movie_app/core/utils/shimmer_widgets/popular_movie_shimmer.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_recommendation_use_case.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_event.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_state.dart';
import 'package:intl/intl.dart' as intl;
import 'package:movie_app/movies/presentation/controller/recommendation_bloc/recommendation_bloc.dart';
import 'package:movie_app/movies/presentation/controller/recommendation_bloc/recommendation_event.dart';
import 'package:movie_app/movies/presentation/controller/recommendation_bloc/recommendation_state.dart';

class DetailsMovie extends StatelessWidget {
  final int movieId;
  const DetailsMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider<MovieDetailsBloc>(
              create: (context) => MovieDetailsBloc(
                  DetailsMovieUseCaseParamters(movieId: movieId))
                ..add(
                  MovieDetailsLoadingEvent(
                    paramters: DetailsMovieUseCaseParamters(movieId: movieId),
                  ),
                ),
              child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                builder: (context, state) {
                  if (state is MovieDetailsFailureState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child:
                            CustomErrorWidget(errMessage: state.errorMessage),
                      ),
                    );
                  } else if (state is MovieDetailsSuccessState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.2,
                          child: CachedNetworkImage(
                            imageUrl: ApiConstance.imageUrl(
                              path: state.movie.backdropPath,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              AppConstance.noImage,
                              fit: BoxFit.fill,
                            ),
                            placeholder: (context, url) => Image.asset(
                              AppConstance.imageLoading,
                            ),
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height / 3.2,
                            fadeInDuration: const Duration(milliseconds: 500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, top: 24, right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.movie.title,
                                style: Styles.textStyle22,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF303030),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      intl.DateFormat('yyyy').format(
                                          DateTime.parse(
                                              state.movie.releaseDate)),
                                      style: Styles.textStyle14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 32,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        state.movie.voteAverage.toString(),
                                        style: Styles.textStyle14,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 32,
                                  ),
                                  Text(
                                    '${state.movie.runtime ~/ 60}H ${state.movie.runtime % 60}M',
                                    style: Styles.textStyle14
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                state.movie.overview,
                                style: Styles.textStyle14,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Genres: ${state.movie.genres.map((e) => e.name).join(', ')}',
                                style: Styles.textStyle14
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Text(
                            'MORE LIKE THIS',
                            style: Styles.textStyle18,
                          ),
                        ),
                        BlocProvider<MovieRecommendationBloc>(
                          create: (context) => MovieRecommendationBloc(
                            MovieRecommendationUseCaseParamters(
                                movieId: movieId),
                          )..add(MovieRecommendationLoadingEvent(
                              movieRecommendationUseCaseParamters:
                                  MovieRecommendationUseCaseParamters(
                                      movieId: movieId))),
                          child: BlocBuilder<MovieRecommendationBloc,
                              MovieRecommendationState>(
                            builder: (context, state) {
                              if (state is MovieRecommendationFailureState) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: CustomErrorWidget(
                                        errMessage: state.errorMessage),
                                  ),
                                );
                              } else if (state
                                  is MovieRecommendationSuccessState) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, top: 8, right: 16.0),
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2 / 3,
                                      crossAxisSpacing: 6,
                                      mainAxisSpacing: 5,
                                    ),
                                    itemCount:
                                        state.movieRecommendations.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl: ApiConstance.imageUrl(
                                            path: state
                                                .movieRecommendations[index]
                                                .backdropPath,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            AppConstance.noImage,
                                            fit: BoxFit.fill,
                                          ),
                                          placeholder: (context, url) =>
                                              Image.asset(
                                            AppConstance.imageLoading,
                                          ),
                                          fit: BoxFit.fill,
                                          fadeInDuration:
                                              const Duration(milliseconds: 500),
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
                        ),
                      ],
                    );
                  } else {
                    return NowPlayingMovieShimmer(
                      height: MediaQuery.of(context).size.height / 3.2,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
