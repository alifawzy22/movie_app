import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/movies/presentation/components/home_view/now_playing_section.dart';
import 'package:movie_app/movies/presentation/components/home_view/popular_section.dart';
import 'package:movie_app/movies/presentation/components/home_view/top_rated_section.dart';

class HomeMovie extends StatelessWidget {
  const HomeMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const NowPlayingSection(),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular',
                        style: Styles.textStyle16,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextButton.icon(
                          onPressed: () {
                            // Popular Movies...
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ),
                          label: Text(
                            'See More',
                            style: Styles.textStyle14
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularSection(),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Rated',
                        style: Styles.textStyle16,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextButton.icon(
                          onPressed: () {
                            // Top Rated Movies...
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ),
                          label: Text(
                            'See More',
                            style: Styles.textStyle14
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TopRatedSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
