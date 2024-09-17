import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class TextAccountType extends StatelessWidget {
  const TextAccountType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "179".tr,
      style: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
        letterSpacing: 1.2,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }
}