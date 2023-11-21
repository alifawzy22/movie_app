import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;
  const CustomErrorWidget({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,
      style: Styles.textStyle24,
      textAlign: TextAlign.center,
    );
  }
}
