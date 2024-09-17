import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

getDialog(String title, String message) async {
  return await Get.defaultDialog(
    title: title,
    middleText: message,
    middleTextStyle: TextStyle(color: AppColor.TextColor()),
    titleStyle: TextStyle(color: AppColor.TextColor()),
    backgroundColor: AppColor.Backgroundcolor(),
  );
}

getSnakBar(String title, String message, int seconds) async {
  return Get.snackbar(title, message,
      colorText: AppColor.TextColor(),
      backgroundColor: AppColor.Backgroundcolor().withOpacity(0.7),
      duration: Duration(seconds: seconds));
}
