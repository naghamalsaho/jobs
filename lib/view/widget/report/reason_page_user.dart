import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/report/report_item.dart';

class CustomUserReportReasonPage extends StatelessWidget {
  const CustomUserReportReasonPage({
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
            padding: EdgeInsets.all(16.0),
            child: Center(
                child: CustomTextTitle(
              text: "100".tr,
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            height: 5,
            endIndent: 10,
            indent: 10,
            color: AppColor.Grey(),
          ),
          Center(
              child: CustomTextBody(
            text: "101".tr,
          )),
          ReportItem(
            onTap: () {
              controller.setReasonId(1);
              controller.changePage(4);
            },
            title: "107".tr,
          ),
          ReportItem(
            onTap: () {
              controller.changePage(1);
              controller.setReasonId(2);
            },
            title: "108".tr,
          ),
          ReportItem(
            onTap: () {
              controller.changePage(4);
              controller.setReasonId(3);
            },
            title: "109".tr,
          ),
          ReportItem(
            onTap: () {
              controller.changePage(3);
              controller.setReasonId(6);
            },
            title: "104".tr,
          ),
        ],
      ),
    );
  }
}
