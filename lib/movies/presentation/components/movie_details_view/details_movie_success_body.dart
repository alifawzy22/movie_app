import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/custom_cached_network_image.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:intl/intl.dart' as intl;

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
              path: movie.backdropPath,
            ),
            height: MediaQuery.of(context).size.height / 3.2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 24, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
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
                      intl.DateFormat('yyyy')
                          .format(DateTime.parse(movie.releaseDate)),
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
                        movie.voteAverage.toString(),
                        style: Styles.textStyle14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Text(
                    '${movie.runtime ~/ 60}H ${movie.runtime % 60}M',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                movie.overview,
                style: Styles.textStyle14,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Genres: ${movie.genres.map((e) => e.name).join(', ')}',
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
