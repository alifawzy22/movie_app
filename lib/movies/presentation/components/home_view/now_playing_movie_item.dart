import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/custom_cached_network_image.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/presentation/views/movie_details_view.dart';

class NowPlayingMovieItem extends StatelessWidget {
  final Movie movie;
  const NowPlayingMovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsView(
              movieId: movie.id,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomNetworkImage(
            backdropPath: ApiConstance.imageUrl(
              path: movie.backdropPath,
            ),
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Positioned(
            bottom: 50,
            child: Container(
              color: Colors.black,
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red,
                  ),
                  Text(
                    'Now Playing',
                    style: Styles.textStyle14,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 16.0,
              child: Text(
                movie.title,
                style: Styles.textStyle18.copyWith(
                  backgroundColor: Colors.black,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
