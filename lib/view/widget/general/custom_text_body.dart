import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomTextBody extends StatelessWidget {
  final String text;
  const CustomTextBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppColor.Grey(),
            height: 1.5
          ),
        ));
  }
}
