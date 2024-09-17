import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/report/custom_back.dart';

import '../general/custom_text_title.dart';

class CustomSendReportMePage extends StatelessWidget {
  const CustomSendReportMePage({
    super.key,
    required this.controller,
    //required this.id,
    required this.onPressedSendPerprt,
  });

  final ReportController controller;
  //final int id;
  final Function() onPressedSendPerprt;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColor.White(),
      ),

      //width: Get.width,
      // padding: const EdgeInsets.all(20),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomReportBack(onPressed: () {
                  controller.changePage(0);
                }),
                CustomTextTitle(
                  text: "100".tr,
                ),
                const SizedBox(width: 40)
              ],
            ),
          ),
          Divider(
            height: 5,
            endIndent: 10,
            indent: 10,
            color: AppColor.Grey(),
          ),
          Center(
              child: CustomTextBody(
            text: "112".tr,
          )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CustomButtomAuth(
                text: "106".tr,
                onPressed: () async {
                  controller.who!.text = controller.userName;
                  await onPressedSendPerprt();
                  controller.resetPage();
                  Get.back();
                },
                color: AppColor.Grey().withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

