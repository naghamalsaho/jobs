import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/settings/check_password.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';

abstract class CheckPasswordController extends GetxController {
  showPassWord();
  checkPassword();
}

class CheckPasswordControllerImp extends CheckPasswordController {
  checkPasswordData checkpasswordData = checkPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController password;

  bool isShowPassword = true;
  @override
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  @override
  checkPassword() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await checkpasswordData.postData(password.text);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {
          print("yesssssss200sss");
        getSnakBar("24".tr,  "${response["message"]}" , 3);
          Get.offAndToNamed(AppRoute.changePassword);
        } else {
          if (response['status'] == 401) {
            print("401");
                   getDialog("203".tr,  "${response["message"]}" );

            statusRequest = StatusRequest.failure;
          }
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }
}
