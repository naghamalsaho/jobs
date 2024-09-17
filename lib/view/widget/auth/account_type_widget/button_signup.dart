import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:get/get.dart';

class ButtonSignUp extends StatelessWidget {
  final void Function()? onPressed;
  const ButtonSignUp({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.White(),
        backgroundColor: AppColor.Pink(),
        //padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        textStyle:  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.TextColor()
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      onPressed: onPressed,
      child:  Text("178".tr),
    );
  }
}
