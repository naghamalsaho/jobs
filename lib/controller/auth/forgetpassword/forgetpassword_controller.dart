import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/auth/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");

      var response = await checkEmailData.postdata(email.text);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {
          Get.offNamed(AppRoute.verfiyCodeForgetpassword,
              arguments: {"email": email.text});
        } else if (response['status'] == 500) {
          Get.defaultDialog(
              title: "203".tr, middleText: "The selected email is invalid.");
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
