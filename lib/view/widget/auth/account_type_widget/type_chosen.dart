import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

class AccountTypeChosen extends StatelessWidget {
  const AccountTypeChosen({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.toString().replaceAll('_', ' ').capitalizeFirst!,
        style: TextStyle(
          color: AppColor.praimaryColor,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 5),
            ),
          ],
        ));
  }
}
