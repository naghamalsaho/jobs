import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class IconHomeAppBar extends StatelessWidget {
  const IconHomeAppBar({
    super.key,
    required this.onPressedSearch,
    required this.icon,
  });

  final void Function()? onPressedSearch;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.White(),
      borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 2),
      width: 50,
      child: IconButton(
        icon: Icon(
          icon,
          size: 26,
          color: AppColor.PraimaryColor()
        ),
        onPressed: onPressedSearch,
      ),
    );
  }
}
