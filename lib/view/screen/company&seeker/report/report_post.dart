import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/view/widget/report/another_reason_page.dart';
import 'package:jobs/view/widget/report/send_report_page.dart';
import '../../../widget/report/reason_page_post&opportunity.dart';

class ReportSheetPost extends StatelessWidget {
  final ReportController controller = Get.put(ReportController());
  final int id;
  ReportSheetPost({required this.id});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentPage.value) {
        case 0:
          return ReasonPostsReportPage();
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

class ReasonPostsReportPage extends StatelessWidget {
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
        controller.reportPost(id);
      },
      textEditingController: controller.another_reason_post,
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
        controller.reportPost(id);
        
      },
    );
  }
}
