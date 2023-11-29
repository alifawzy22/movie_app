import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/presentation/components/movie_details_view/movie_details_rate.dart';

class MovieDetailsYearRateTimeRow extends StatelessWidget {
  const MovieDetailsYearRateTimeRow({
    super.key,
    required this.movie,
  });

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            intl.DateFormat('yyyy').format(DateTime.parse(movie.releaseDate)),
            style: Styles.textStyle14,
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        MovieDetailsRate(voteAverage: movie.voteAverage),
        const SizedBox(
          width: 32,
        ),
        Text(
          '${movie.runtime ~/ 60}H ${movie.runtime % 60}M',
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
