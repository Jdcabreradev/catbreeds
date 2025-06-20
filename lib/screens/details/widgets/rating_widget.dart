import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final String text;
  final int rating;

  const RatingWidget({super.key, required this.text, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating
                    ? Icons.star_rate_rounded
                    : Icons.star_border_rounded,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
