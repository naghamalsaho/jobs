import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class AccountType extends StatelessWidget {
  AccountType({super.key, required this.text,required this.icon });
  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColor.IconColor()),
      title: Text(text),
    );
  }
}
