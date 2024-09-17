import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({super.key, required this.title, this.onPressed, required this.icon});
  final String title;
  final void Function()? onPressed;
 final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColor.PraimaryColor(),),
      label: Text(
        title,
        style: TextStyle(
          color: AppColor.TextColor(),
        ),
      ),
       style: ElevatedButton.styleFrom(backgroundColor: AppColor.White()),
    );
  }
}
