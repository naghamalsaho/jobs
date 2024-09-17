import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      backgroundColor: AppColor.White(),
      titleStyle: TextStyle(color: AppColor.TextColor()),
      title: "203".tr,
      middleTextStyle: TextStyle(color: AppColor.TextColor()),
      middleText: "214".tr,
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.Pink()),
            child: Text(
              "215".tr,
              style: TextStyle(color: AppColor.TextColor()),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.Pink()),
            child: Text(
              "216".tr,
              style: TextStyle(color: AppColor.TextColor()),
            )),
      ]);
  return Future.value(true);
}
