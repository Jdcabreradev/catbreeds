import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String headerText;

  const HeaderWidget({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/imgs/cat-small.png'),
        SizedBox(width: 5),
        Text(
          headerText,
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
