import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/company/create_opportunity.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import 'package:jobs/view/widget/apply/choose_apply_way.dart';

import '../../core/constants/routes.dart';

abstract class OpportunityDetailsController extends GetxController {
  initalData();
  goToEditPage(OpportunityModel opportuntiyModel2);
  chooseApplyWay(int id);
  report(int id);
  deleteOpportunity(int id);
  back();
  isOwner(int id);
}

class OpportunityDetailsControllerImp extends OpportunityDetailsController {
  late OpportunityModel opportuntiyModel;
  late int idUserOpportunityOwner;

  MyServices myServices = Get.find();
  final reportController = Get.put(ReportController());
  OpportunityData opportunityData = OpportunityData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late String account;

  @override
  bool? isOwner(int id) {
    idUserOpportunityOwner == id ? true : false;
    return null;
  }

  @override
  goToEditPage(OpportunityModel opportuntiyModel2) {
    Get.offNamed(AppRoute.editOpportunity,
        arguments: {"opportuntiyModel": opportuntiyModel2});
  }

  @override
  report(int id) {
    reportController.showReportSheetOpportunity(id);
  }

  @override
  deleteOpportunity(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await opportunityData.deleteOpportunity(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        Get.find<GetPostsAndOpportunityControllerImp>().getOpportunitesData();
        update();
        Get.offAllNamed(AppRoute.mainScreensCompany);
        getSnakBar("24".tr, "${response["message"]}", 3);
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
    }
    update();
  }

  @override
  void back() {
    Get.back();
  }

  @override
  chooseApplyWay(int id) {
    Get.defaultDialog(
      backgroundColor: AppColor.Backgroundcolor(),
        title: "211".tr,
        titleStyle: TextStyle(color: AppColor.TextColor()),
        content: ApplicationWays(
          onPressedCV: () {
            Get.offAndToNamed(AppRoute.applyCV,
                arguments: {"id_opportunity": id});
          },
         
        ));
  }

  @override
  initalData() {
    opportuntiyModel = Get.arguments['opportuntiyModel'];
    idUserOpportunityOwner = int.parse(myServices.box.read("id"));
  }

  @override
  void onInit() {
    initalData();
    account = myServices.box.read("account");
    super.onInit();
  }
}
