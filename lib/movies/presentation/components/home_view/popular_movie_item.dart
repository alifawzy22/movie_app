import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_constance.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class PopularMovieItem extends StatelessWidget {
  final Movie movie;
  const PopularMovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: ApiConstance.imageUrl(
          path: movie.backdropPath,
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
  }
}
