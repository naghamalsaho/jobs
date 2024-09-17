import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class buildInfo extends StatelessWidget {
  final String info;
  final IconData icon;
  buildInfo({Key? key, required this.info, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 44,
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColor.PraimaryColor(),
          
        ),
        title: Text(
          info,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColor.TextColor()),
        ),
      ),
    );
  }
}
