import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/custom_cached_network_image.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/presentation/components/movie_details_view/movie_details_year_rate_time_row.dart';

class MovieDetailsSuccessBody extends StatelessWidget {
  final MovieDetails movie;
  const MovieDetailsSuccessBody({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.2,
          child: CustomNetworkImage(
            backdropPath: ApiConstance.imageUrl(
              path: movie.backdropPath!,
            ),
            height: MediaQuery.of(context).size.height / 3.2,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            movie.title,
            style: Styles.textStyle22,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: MovieDetailsYearRateTimeRow(movie: movie),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            movie.overview,
            style: Styles.textStyle14,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            'Genres: ${movie.genres.map((e) => e.name).join(', ')}',
            style: Styles.textStyle14.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
