import 'package:flutter/material.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/presentation/components/home_view/top_rated_movie_item.dart';

class TopRatedMoviesListView extends StatelessWidget {
  final List<Movie> movies;
  const TopRatedMoviesListView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3.6,
            child: TopRatedMovieItem(movie: movies[index]),
          ),
        );
      },
    );
  }
}
