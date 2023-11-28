import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/components/movie_details_view/details_movie_body.dart';

class MovieDetailsView extends StatelessWidget {
  final int movieId;
  const MovieDetailsView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsMovieViewBody(movieId: movieId),
    );
  }
}
