import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomTextEmail extends StatelessWidget {
  final String text;
  const CustomTextEmail({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColor.black),
        ));
  }
}
