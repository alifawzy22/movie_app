import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/custom_error_widget.dart';
import 'package:movie_app/core/utils/shimmer_widgets/movie_details_shimmer.dart';
import 'package:movie_app/movies/domain/usecases/get_details_movie_use_case.dart';
import 'package:movie_app/movies/presentation/components/movie_details_view/details_movie_success_body.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_event.dart';
import 'package:movie_app/movies/presentation/controller/details_bloc/movie_details_state.dart';

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
            return MovieDetailsSuccessBody(movie: state.movie);
          } else {
            return const MovieDetailsShimmer();
          }
        },
      ),
    );
  }
}
