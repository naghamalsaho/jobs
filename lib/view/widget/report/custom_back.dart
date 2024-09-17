
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomReportBack extends StatelessWidget {
  const CustomReportBack({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColor.TextColor(),
        ),
        onPressed: onPressed);
  }
}