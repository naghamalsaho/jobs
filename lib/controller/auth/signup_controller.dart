import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/auth/signupdata.dart';
import 'package:jobs/view/widget/auth/account_type_widget/button_signup.dart';
import 'package:jobs/view/widget/auth/account_type_widget/icon_type.dart';
import 'package:jobs/view/widget/auth/account_type_widget/type_chosen.dart';

abstract class SinUpController extends GetxController {
  SignUp();
  goToSignIn();
  showPassWord();
}

class SignUpControllerImp extends SinUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());
  MyServices myServices = Get.find();

  //String? selectedAccountType;

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  @override
  SignUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");
      var response = await signUpData.postdata(
          username.text, password.text, email.text, accountType.value);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {
          myServices.box.write("account", accountType.value);
          // myServices.box.write("step", "2");
          Get.offNamed(AppRoute.verifyCodeRegister,
              arguments: {"email": email.text});
          getSnakBar("24".tr, "Verification Code sent to\n ${email.text} ", 3);
        } else if (response['status'] == 422) {
          Get.defaultDialog(
              title: "203".tr, middleText: "${response["message"]}");
          statusRequest = StatusRequest.failure;
        } else if (response['status'] == 400) {
          Get.defaultDialog(
              title: "203".tr, middleText: "${response["message"]}");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  var accountType = ''.obs;
  bool isActiveseeker = false;
  bool isActiveCompany = false;

  void setAccountSeeker(String type) {
    isActiveseeker = true;
    isActiveCompany = false;
    accountType.value = type;
  }

  void setAccountCompany(String type) {
    isActiveseeker = false;
    isActiveCompany = true;
    accountType.value = type;
  }

  void ChooseAccountType() {
    if (formstate.currentState!.validate()) {
      Get.defaultDialog(
          backgroundColor: AppColor.White(),
          title: "179".tr,
          titleStyle: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                blurRadius: 4.0,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          content: Obx(() => Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AccountTypeIcon(
                      icon: Icons.person_search,
                      color: isActiveseeker
                          ? AppColor.praimaryColor
                          : AppColor.grey,
                      onTap: () {
                        setAccountSeeker('job_seeker');
                      },
                    ),
                    AccountTypeIcon(
                      icon: Icons.business,
                      color: isActiveCompany
                          ? AppColor.PraimaryColor()
                          : AppColor.Grey(),
                      onTap: () {
                        setAccountCompany('company');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: AccountTypeChosen(
                    text: accountType == 'company'
                        ? "200".tr
                        : accountType == 'job_seeker'
                            ? "201".tr
                            : "$accountType",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonSignUp(
                  onPressed: () {
                    print(accountType == '');
                    accountType != '' ? SignUp() : 
                            getSnakBar("203".tr, "202".tr, 3);

                    Get.back();
                  },
                )
              ])));
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
