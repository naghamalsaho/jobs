import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomTextUser extends StatelessWidget {
  final String text;
  const CustomTextUser({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(color: AppColor.praimaryColor),
    );
  }
}
