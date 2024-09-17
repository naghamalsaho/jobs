
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String? content;
  final IconData icon;

  const InfoRow(
      {super.key, required this.title, this.content, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 2.3,
      height: 45,
      //   padding: EdgeInsets.all(10),
      //  color: Colors.pink.shade100,
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColor.IconColor(),
          size: 20,
        ),
        title: Text(
          title,
          style:  TextStyle(
            fontSize: 16,
            color: AppColor.TextColor()
          ),
        ),
        // subtitle: Text(contcontent!),
      ),
    );
  }
}
