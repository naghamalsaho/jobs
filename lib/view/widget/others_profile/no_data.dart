
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(color: AppColor.grey, fontSize: 20),
        ),
        Text(
          text2,
          style: TextStyle(color: AppColor.grey, fontSize: 20),
        ),
      ],
    ));
  }
}
