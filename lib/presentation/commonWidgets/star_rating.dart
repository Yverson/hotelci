import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final double? size;
  final bool border;

  const StarRating({
    Key? key,
    this.starCount = 5,
    this.rating = .0,
    required this.onRatingChanged,
    required this.color,
    this.size,
    this.border = false,
  }) : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        border ? Icons.star_border_outlined : Icons.star,
        size: size ?? 14,
        color: border
            ? Get.isDarkMode
                ? Colors.white54
                : Colors.black.withOpacity(.5)
            : const Color(0xffE8E8E8),
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        size: size ?? 14,
        color: Colors.amber,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: size ?? 14,
        color: Colors.amber,
      );
    }
    return InkResponse(
      onTap:
          // ignore: unnecessary_null_comparison
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
