import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class MovieDetailsRate extends StatelessWidget {
  const MovieDetailsRate({
    super.key,
    required this.voteAverage,
  });

  final num voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          voteAverage.toString(),
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
