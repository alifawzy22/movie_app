import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/components/home_view/home_movie_view_body.dart';

class HomeMovieView extends StatelessWidget {
  const HomeMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverFillRemaining(
            child: HomeMovieViewBody(),
          )
        ],
      ),
    );
  }
}
