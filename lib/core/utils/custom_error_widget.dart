import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;
  final double height;
  final double width;
  const CustomErrorWidget(
      {super.key,
      required this.errMessage,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Text(
          errMessage,
          style: Styles.textStyle24,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
