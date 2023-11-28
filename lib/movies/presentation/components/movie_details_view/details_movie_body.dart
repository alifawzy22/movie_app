import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/movies/presentation/components/movie_details_view/movie_details_section.dart';
import 'package:movie_app/movies/presentation/components/movie_details_view/movie_recommendation_section.dart';

class DetailsMovieViewBody extends StatelessWidget {
  const DetailsMovieViewBody({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: MovieDetailsSection(
            movieId: movieId,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'MORE LIKE THIS',
              style: Styles.textStyle18,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: MovieRecommendationSection(
            movieId: movieId,
          ),
        ),
      ],
    );
  }
}
