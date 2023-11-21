import 'package:flutter/material.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/presentation/components/home_view/now_playing_movie_item.dart';

class NowPlayingMovieListView extends StatelessWidget {
  final List<Movie> movies;
  const NowPlayingMovieListView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: NowPlayingMovieItem(movie: movies[index]),
        );
      },
    );
  }
}
