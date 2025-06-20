import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/imgs/cat-small.png'),
        SizedBox(width: 5),
        Text(
          "CatBreeds",
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
