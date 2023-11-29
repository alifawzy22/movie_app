import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_constance.dart';
import 'package:movie_app/core/utils/network/api_constance.dart';

class CustomNetworkImage extends StatelessWidget {
  final String backdropPath;
  final double? height;
  const CustomNetworkImage(
      {super.key, required this.backdropPath, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: ApiConstance.imageUrl(
        path: backdropPath,
      ),
      errorWidget: (context, url, error) => Image.asset(
        AppConstance.noImage,
        fit: BoxFit.fill,
      ),
      placeholder: (context, url) => Image.asset(
        AppConstance.imageLoading,
      ),
      fit: BoxFit.fill,
      height: height,
      fadeInDuration: const Duration(milliseconds: 500),
    );
  }
}
