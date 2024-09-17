import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/report/custom_back.dart';

class CustomAnotherReasonPage extends StatelessWidget {
  const CustomAnotherReasonPage({
    super.key,
    required this.controller,
    required this.onPressedReportAnotherReason,
    required this.textEditingController,
  });

  final ReportController controller;
  final Function() onPressedReportAnotherReason;
  final TextEditingController? textEditingController;
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            text: "105".tr,
          )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              style: TextStyle(
                color: AppColor.TextColor(),
              ),
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: "104".tr,
                labelStyle: TextStyle(color: AppColor.TextColor()),
                hintStyle: TextStyle(color: AppColor.TextColor()),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.TextColor()),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.TextColor()),
                ),
                iconColor: AppColor.IconColor(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.Grey()),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CustomButtomAuth(
                text: "106".tr,
                onPressed: () async {
                  await onPressedReportAnotherReason();
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
