import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/view/widget/report/another_reason_page.dart';
import 'package:jobs/view/widget/report/reason_page_post&opportunity.dart';
import 'package:jobs/view/widget/report/send_report_page.dart';

class ReportSheetOpportunity extends StatelessWidget {
  final ReportController controller = Get.put(ReportController());
  final int id;
  ReportSheetOpportunity({required this.id});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentPage.value) {
        case 0:
          return ReasonOpportunityReportPage();
        case 1:
          return SendPeportPage(id);
        case 2:
          return AnotherReasonPage(id);
        default:
          return Container();
      }
    });
  }
}

class ReasonOpportunityReportPage extends StatelessWidget {
  final ReportController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return ReasonReportPage(controller: controller);
  }
}

class AnotherReasonPage extends StatelessWidget {
  final ReportController controller = Get.find();
  final int id;
  AnotherReasonPage(this.id);
  @override
  Widget build(BuildContext context) {
    return CustomAnotherReasonPage(
      controller: controller,
      onPressedReportAnotherReason: () {
        controller.reportOpportunity(id);
      },
      textEditingController: controller.another_reason_opportunity,
    );
  }
}

class SendPeportPage extends StatelessWidget {
  final ReportController controller = Get.find();
  final int id;
  SendPeportPage(this.id);
  @override
  Widget build(BuildContext context) {
    return CustomSendReportPage(
      controller: controller,
      onPressedSendPerprt: () {
        controller.reportOpportunity(id);
      },
    );
  }
}
