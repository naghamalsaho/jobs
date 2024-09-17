
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: AppColor.White(),
        letterSpacing: 1,
        shadows: [
          Shadow(
            blurRadius: 5.0,
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
