import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/forgetpassword/verifycode_forgetpassword_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        title: Text(
          "34".tr,
          style: TextStyle(color: AppColor.white),
        ),
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
        backgroundColor: AppColor.PraimaryColor(),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView(children: [
                    CustomTextTitle(
                      text: "35".tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextBody(text: " ${"36".tr} \n ${controller.email} "),
                    const SizedBox(
                      height: 30,
                    ),
                    // Center(child: Image.asset(AppImageAsset.otp)),
                    const SizedBox(
                      height: 10,
                    ),
                    OtpTextField(
                      borderRadius: BorderRadius.circular(20),
                      cursorColor: AppColor.Grey(),
                      enabledBorderColor: AppColor.Grey(),
                      focusedBorderColor: AppColor.PraimaryColor(),
                      fieldWidth: 42.0,
                      numberOfFields: 6,
                      borderColor: AppColor.praimaryColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        print("11111  $verificationCode");
                        Get.offNamed(AppRoute.resetPassword, arguments: {
                          "verfiyCodePassWordreset": verificationCode
                        });

                        //  controller.goToResetPassword(verificationCode);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GetBuilder<VerifyCodeControllerImp>(
                      builder: (controller) => InkWell(
                        onTap: controller.remainingTime == 0
                            ? controller.resendCode
                            : null,
                        child: Text(
                          textAlign: TextAlign.end,
                          controller.remainingTime > 0
                              ? ' ${"30".tr} ${controller.timerText}'
                              : "31",
                          style: TextStyle(
                              color: controller.remainingTime > 0
                                  ? AppColor.grey
                                  : AppColor.praimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ])))),
    );
  }
}
