

import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    this.onTap,
    required this.text,
     this.icon,
  });
  final Function()? onTap;
  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: AppColor.IconColor(),
        ),
        title: Text(
          text,
          style: TextStyle(color: AppColor.IconColor(), fontSize: 16),
        ),
        onTap: onTap);
  }
}
