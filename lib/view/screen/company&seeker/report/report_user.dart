import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/view/widget/report/another_reason_page.dart';
import 'package:jobs/view/widget/report/reason_page_user.dart';
import 'package:jobs/view/widget/report/search_user_page.dart';
import 'package:jobs/view/widget/report/send_report_me.dart';
import 'package:jobs/view/widget/report/send_report_page.dart';
import 'package:jobs/view/widget/report/who_page.dart';

class ReportSheetUser extends StatelessWidget {
  final ReportController controller = Get.put(ReportController());
  final int id;
  ReportSheetUser({required this.id});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentPage.value) {
        case 0:
          return ReasonUserReportPage();
        case 1:
          return WhoPage(id);
        case 2:
          return NamePage(id);
        case 3:
          return AnotherReasonPage(id);
        case 4:
          return SendPeportPage(id);
        case 5:
          return SendPeportPageMe(id);
    
        default:
          return Container();
      }
    });
  }
}

class ReasonUserReportPage extends StatelessWidget {
  final ReportController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomUserReportReasonPage(controller: controller);
  }
}

class WhoPage extends StatelessWidget {
  final ReportController controller = Get.find();
  final int id;
  WhoPage(this.id);
  @override
  Widget build(BuildContext context) {
    return CustomChooseWhoPage(controller: controller);
  }
}

class NamePage extends StatelessWidget {
  final ReportController controller = Get.find();
  final int id;

  NamePage(this.id);

  @override
  Widget build(BuildContext context) {
    return ReportSearchUserPage(
      controller: controller,
      id: id,
      onPressedSendPerprt: () {
        controller.reportUser(id);
      },
    );
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
        controller.reportUser(id);
      },
      textEditingController: controller.another_reason_user,
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
        controller.reportUser(id);
      },
    );
  }
}

class SendPeportPageMe extends StatelessWidget {
  final ReportController controller = Get.find();
  final int id;
  SendPeportPageMe(this.id);
  @override
  Widget build(BuildContext context) {
    return CustomSendReportMePage(
      controller: controller,
      onPressedSendPerprt: () {
        controller.reportUser(id);
      },
    );
  }
}
