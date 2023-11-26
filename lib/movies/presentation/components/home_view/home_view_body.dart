import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/components/home_view/custom_movie_header.dart';
import 'package:movie_app/movies/presentation/components/home_view/now_playing_section.dart';
import 'package:movie_app/movies/presentation/components/home_view/popular_section.dart';
import 'package:movie_app/movies/presentation/components/home_view/top_rated_section.dart';

class HomeMovieBody extends StatelessWidget {
  const HomeMovieBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NowPlayingSection(),
        CustomMovieHeader(
          label: 'Popular',
          onPress: () {
            // Popular movies...
          },
        ),
        const PopularSection(),
        Expanded(child: Container()),
        CustomMovieHeader(
            label: 'Top Rated',
            onPress: () {
              // Top Rated movies...
            }),
        const TopRatedSection(),
      ],
    );
  }
}
