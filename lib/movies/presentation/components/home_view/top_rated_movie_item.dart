import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/custom_cached_network_image.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class TopRatedMovieItem extends StatelessWidget {
  final Movie movie;
  const TopRatedMovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CustomNetworkImage(
        backdropPath: ApiConstance.imageUrl(
          path: movie.backdropPath,
        ),
      ),
    );
  }
}
