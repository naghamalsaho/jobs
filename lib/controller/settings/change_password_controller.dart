import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/settings/logout_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/settings/change_password.dart';

abstract class ChangePasswordController extends GetxController {
  showPassWord();
  changePassword();
}

class ChangePasswordControllerImp extends ChangePasswordController {
  changePasswordData changepasswordData = changePasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController password;
  late TextEditingController password_confirmation;
  late String account;
  bool isShowPassword = true;
  bool isShowRePassword = true;
  final logOutController = Get.put(LogoutControllerImp());
  MyServices myServices = Get.find();

  @override
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  showRePassWord() {
    isShowRePassword = isShowRePassword == true ? false : true;

    update();
  }

  changePassword() async {
    if (password.text != password_confirmation.text) {
      getDialog("203".tr, "213".tr);
    } else {
      if (formstate.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        var response = await changepasswordData.postData(
            password.text, password_confirmation.text);
        print("================$response  Controller");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 200) {
            getSnakBar("24".tr, "${response["message"]}", 3);
            myServices.box.write("token", "${response["data"]["token"]}");
            account == 'company'
                ? Get.offAllNamed(AppRoute.mainScreensCompany)
                : Get.offAllNamed(AppRoute.mainScreens);
            //logOutController.logout();
          } else {
            print(response);
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    account = myServices.box.read("account");
    password = TextEditingController();
    password_confirmation = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    password_confirmation.dispose();
    super.dispose();
  }
}
