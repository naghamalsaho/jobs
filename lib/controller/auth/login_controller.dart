import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/auth/login.dart';
import 'package:jobs/core/services/services.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  String? device_token;
  // late String account;
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    print(device_token);
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("11111111111111111111111111  Controller");
      var response = await loginData.postdata(email.text, password.text);

      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == 200) {
          // await loginData.device_token(device_token);
          myServices.box.write("token", "${response["data"]["token"]}");
          myServices.box.write("id", "${response["data"]["user"]["id"]}");
          myServices.box.write("email", "${response["data"]["user"]["email"]}");
          myServices.box
              .write("user_name", "${response["data"]["user"]["user_name"]}");

          myServices.box
              .write("account", "${response["data"]["user"]["type"]}");
          myServices.box.write(
              "image",
              "${response["data"]["user"]["type"]}" == 'company'
                  ? response["data"]["user"]['more_info']['logo']
                  : response["data"]["user"]['more_info']['image']);

          myServices.box.write("step", "4");
          print(response['data']['user']);
          print("token ${response["data"]["token"]}");
          print("${response["data"]["user"]["type"]}");
          var response333 = await loginData.device_token(device_token);
          print(
              "==========================${response333['status']}===============================================");

          if ("${response["data"]["user"]["type"]}" == "job_seeker") {
            Get.offAllNamed(AppRoute.mainScreens);
          } else {
            if ("${response["data"]["user"]["type"]}" == "company")
              Get.offAllNamed(AppRoute.mainScreensCompany);
          }
          getSnakBar(
              "24".tr,
              response['message'],
              // "Welcolme ${response["data"]["user"]["user_name"]} \nBy : ${response['data']['user']['email']}",
              3);
        } else if (response['status'] == 401||response['status'] == 403) {
          getDialog("203".tr, "${response["message"]}");
        }
        update();
      }
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    await FirebaseMessaging.instance.getToken().then((value) {
      device_token = value;
      print(device_token);
    });
    print(device_token);
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
