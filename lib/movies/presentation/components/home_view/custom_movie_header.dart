import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomMovieHeader extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  const CustomMovieHeader({
    super.key,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Styles.textStyle16,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: onPress,
              icon: const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
              ),
              label: Text(
                'See More',
                style: Styles.textStyle14.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
