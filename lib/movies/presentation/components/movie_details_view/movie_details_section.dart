import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_constance.dart';
import 'package:movie_app/core/utils/custom_error_widget.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/core/utils/shimmer_widgets/movie_details_shimmer.dart';
import 'package:movie_app/core/utils/shimmer_widgets/now_playing_movie_shimmer.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie_use_case.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_event.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_state.dart';
import 'package:intl/intl.dart' as intl;

class MovieDetailsSection extends StatelessWidget {
  final int movieId;
  const MovieDetailsSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) =>
          MovieDetailsBloc(DetailsMovieUseCaseParamters(movieId: movieId))
            ..add(
              MovieDetailsLoadingEvent(
                paramters: DetailsMovieUseCaseParamters(movieId: movieId),
              ),
            ),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsFailureState) {
            return CustomErrorWidget(
              errMessage: state.errorMessage,
              height: MediaQuery.of(context).size.height * 0.60,
              width: MediaQuery.of(context).size.width,
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
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 24, right: 16.0),
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
                                  DateTime.parse(state.movie.releaseDate)),
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
                            style:
                                Styles.textStyle14.copyWith(color: Colors.grey),
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
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const MovieDetailsShimmer();
          }
        },
      ),
    );
  }
}
