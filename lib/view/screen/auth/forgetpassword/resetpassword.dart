import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.Backgroundcolor(),
        appBar: AppBar(
          title: Text(
            "37".tr,
            style: TextStyle(color: AppColor.white),
          ),
          iconTheme: IconThemeData(
            color: AppColor.white,
          ),
          backgroundColor: AppColor.PraimaryColor(),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: [
                        CustomTextTitle(
                          text: "38".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBody(text: "39".tr),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormAuth(
                          valid: (value) {
                            return isPasswordCompliant(value!);
                          },
                          mycontroller: controller.password,
                          hinttext: "14".tr,
                          labeltext: "15".tr,
                          iconData: controller.isShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showPassWord();
                          },
                        ),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 8, 20, "password");
                          },
                          mycontroller: controller.repassword,
                          hinttext: "40".tr,
                          labeltext: "15".tr,
                          iconData: controller.isShowRePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: controller.isShowRePassword,
                          onTapIcon: () {
                            controller.showRePassWord();
                          },
                        ),
                        CustomButtomAuth(
                            color: AppColor.praimaryColor,
                            text: "41".tr,
                            onPressed: () {
                              //  Get.toNamed(AppRoute.successResetpassword);
                              controller.goToSuccessResetPassword();
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                      ]),
                    )))));
  }
}
