import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class FavoriteWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  FavoriteWidget({required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 48.0,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.praimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
