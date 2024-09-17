import 'dart:io';
import 'package:get/get.dart';
import 'package:jobs/controller/apply/get_apply_company_controller.dart';
import 'package:jobs/controller/apply/get_apply_seeker_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/apply/apply_data.dart';


abstract class UpdateApplyController extends GetxController {
  deleteApply(int id);
  updateStatusApply(int id);
}

class UpdateApplyControllerImp extends UpdateApplyController {
  AppliesData appliesData = AppliesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  String selectedApplyStaus = 'waiting';
  final List<String> applystatus = ['waiting', 'accepted', 'rejected'];
  File? cv;
  late String account;

  void Function(String?)? setSelectedStatus(type) {
    selectedApplyStaus = type;
    update();
    return null;
  }

  deleteApply(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await appliesData.deleteApply(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        account == 'company'
            ? Get.find<GetApplyCompanyControllerImp>().getAllAppliesCompany()
            : Get.find<GetApplySeekerControllerImp>().getMyAppliesSeeker();
        update();
        getSnakBar("24".tr,  "${response["message"]}", 3);
        //Get.offAllNamed(AppRoute.);
      } else {
        getDialog("203".tr,  "${response["message"]}");
      }
    }
  }

  updateStatusApply(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await appliesData.updateStatusApply(id, selectedApplyStaus);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        Get.find<GetApplyCompanyControllerImp>().getAllAppliesCompany();
        update();
        getSnakBar("24".tr, "${response["message"]}", 3);
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
    }
  }

  @override
  void onInit() {
    account = myServices.box.read("account");
    super.onInit();
  }
}
