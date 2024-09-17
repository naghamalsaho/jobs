import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/report/custom_back.dart';
import 'package:jobs/view/widget/report/report_item.dart';

class CustomChooseWhoPage extends StatelessWidget {
  const CustomChooseWhoPage({
    super.key,
    required this.controller,
  });

  final ReportController controller;

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
            text: "113".tr,
          )),
          ReportItem(
            onTap: () {
              controller.changePage(5);
            },
            title: "114".tr,
          ),
          ReportItem(
            onTap: () {
              controller.changePage(2);
            },
            title: "115".tr,
          ),
          ReportItem(
            onTap: () {
              controller.changePage(2);
            },
            title: "116".tr,
          ),
        ],
      ),
    );
  }
}
