import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/report_data.dart';
import 'package:jobs/view/screen/company&seeker/report/report_opportunity.dart';
import 'package:jobs/view/screen/company&seeker/report/report_post.dart';
import 'package:jobs/view/screen/company&seeker/report/report_user.dart';

class ReportController extends GetxController {
  ReportData reportData = ReportData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  int reason_id = 0;
  late TextEditingController another_reason_post;
  late TextEditingController another_reason_opportunity;
  late TextEditingController another_reason_user;
  late TextEditingController? who;
    late String userName;
 
  String? whoName;
  var currentPage = 0.obs;
  void resetPage() {
    currentPage.value = 0;
  }

  void changePage(int index) {
    currentPage.value = index;
  }

  void setReasonId(int value) {
    reason_id = value;
    update();
  }

  showReportSheetUser(int id) {
    Get.bottomSheet(
    enterBottomSheetDuration: Duration(
      seconds: 1
    ),
      ReportSheetUser(id: id),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
    );
  }

  showReportSheetPost(int id) {
    Get.bottomSheet(
       enterBottomSheetDuration: Duration(
      seconds: 1
    ),
      ReportSheetPost(id: id),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
    );
  }

  showReportSheetOpportunity(int id) {
    Get.bottomSheet(
       enterBottomSheetDuration: Duration(
      seconds: 1
    ),
      ReportSheetOpportunity(id: id),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
    );
  }

  reportPost(int id_report) async {
    statusRequest = StatusRequest.loading;
    var response = await reportData.reportPost(
        id_report, reason_id.toString(), another_reason_post.text);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        print(response);
        getSnakBar("24".tr,  "${response["message"]}" , 3);
        print(" reported this post ");
        another_reason_post.clear();
      } else {
        statusRequest = StatusRequest.failure;
        if (response['status'] == 400) {
          print(response);
  getDialog("203".tr, "${response["message"]}");        
          print("noo");
        }
      }
    }
    another_reason_post.clear();

    update();
  }

  reportUser(
    int id_report,
  ) async {
    statusRequest = StatusRequest.loading;
    var response = await reportData.reportUser(
      id_report,
      reason_id.toString(),
      another_reason_user.text,
      who!.text
    );
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        getSnakBar("24".tr,  "${response["message"]}" , 3);
        print(" reported this User ");
        another_reason_user.clear();
        who!.clear();
      } else {
        statusRequest = StatusRequest.failure;
        if (response['status'] == 400) {
          print(response);
        getSnakBar("24".tr,  "${response["message"]}" , 3);
          print("noo");
        }
      }
    }
    update();
    another_reason_user.clear();
    who!.clear();
  }

  reportOpportunity(int id_report) async {
    print("reportOpportunity");
    statusRequest = StatusRequest.loading;
    var response = await reportData.reportOpportunity(
        id_report, reason_id.toString(), another_reason_opportunity.text);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        getSnakBar("24".tr,  "${response["message"]}" , 3);

        print("yessssssssssssssssssssssssss200sss");
      } else {
        if (response['status'] == 400) {
          statusRequest = StatusRequest.failure;
  getDialog("203".tr, "${response["message"]}");        
        }
      }
    }
    update();
    another_reason_opportunity.clear();
  }

  @override
  void onInit() {
      userName = myServices.box.read("user_name");

    // id_report = Get.arguments['id_report'];
    another_reason_post = TextEditingController();
    another_reason_user = TextEditingController();
    another_reason_opportunity = TextEditingController();
    who = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    another_reason_post.dispose();
    another_reason_user.dispose();
    another_reason_opportunity.dispose();
    who!.dispose();
    super.dispose();
  }
}
