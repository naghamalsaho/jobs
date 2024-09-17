import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontFamily: "Gafata", color: AppColor.TextColor()),
      ),
      onTap: onTap,
      trailing: Icon(
        Icons.chevron_right,
        color: AppColor.Grey(),
      ),
    );
  }
}
