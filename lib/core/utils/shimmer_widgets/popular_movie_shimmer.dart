import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularMovieShimmer extends StatelessWidget {
  const PopularMovieShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey.shade700,
      direction: ShimmerDirection.ltr,
      enabled: true,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5.2,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.6,
                  height: MediaQuery.of(context).size.height / 5.2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white60,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
