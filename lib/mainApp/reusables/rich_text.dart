import 'package:flutter/material.dart';

import 'colors.dart';

class CustomRichText extends StatelessWidget {
  final String title;
  final String secondaryTitle;
  const CustomRichText({
    super.key,
    required this.title,
    required this.secondaryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: black,
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: secondaryTitle,
            style: const TextStyle(
              color: black,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
