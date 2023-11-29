import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/custom_cached_network_image.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';

class MovieRecommendationSuccessBody extends StatelessWidget {
  final List<MovieRecommendation> movieRecommendations;
  const MovieRecommendationSuccessBody(
      {super.key, required this.movieRecommendations});

  @override
  Widget build(BuildContext context) {
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
        itemCount: movieRecommendations.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomNetworkImage(
              backdropPath: ApiConstance.imageUrl(
                path: movieRecommendations[index].backdropPath,
              ),
            ),
          );
        },
      ),
    );
  }
}
