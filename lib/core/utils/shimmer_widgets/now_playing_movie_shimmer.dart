import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingMovieShimmer extends StatelessWidget {
  final double? height;
  const NowPlayingMovieShimmer({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey.shade700,
      direction: ShimmerDirection.ltr,
      enabled: true,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: height ?? MediaQuery.of(context).size.height * 0.4,
        child: Container(
          color: Colors.white60,
        ),
      ),
    );
  }
}
