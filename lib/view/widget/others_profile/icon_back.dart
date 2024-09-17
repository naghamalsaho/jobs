import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class IconBack extends StatelessWidget {
  IconBack({Key? key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon:  Icon(
        Icons.arrow_back_sharp,
        color: AppColor.White(),
        size: 26,
      ),
    );
  }
}
