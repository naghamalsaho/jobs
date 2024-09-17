import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/verifycode_register_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';

import '../../widget/general/custom_text_body.dart';

class VerifyCodeRegister extends StatelessWidget {
  const VerifyCodeRegister({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeRegisterControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.PraimaryColor(),
          elevation: 0.0,
          title: Text(
            "27".tr,
            style: TextStyle(color: AppColor.white),
                ),
                iconTheme: IconThemeData(color: AppColor.white),
        ),
        body: GetBuilder<VerifyCodeRegisterControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: ListView(children: [
                        CustomTextTitle(
                          text: "28".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBody(text: "237".tr),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(child: Image.asset(AppImageAsset.otp)),
                        const SizedBox(
                          height: 10,
                        ),
                        OtpTextField(
                          borderRadius: BorderRadius.circular(20),
                          focusedBorderColor: AppColor.PraimaryColor(),
                          cursorColor: AppColor.Grey(),
                          enabledBorderColor: AppColor.Grey(),
                          fieldWidth: 42.0,
                          numberOfFields: 6,
                          borderColor: const Color.fromARGB(255, 129, 45, 168),
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<VerifyCodeRegisterControllerImp>(
                          builder: (controller) => InkWell(
                            onTap: controller.remainingTime == 0
                                ? controller.resendCode
                                : null,
                            child: Text(
                              textAlign: TextAlign.end,
                              controller.remainingTime > 0
                                  ? " ${"30".tr} ${controller.timerText}"
                                  : "31".tr,
                              style: TextStyle(
                                  color: controller.remainingTime > 0
                                      ? AppColor.grey
                                      : AppColor.praimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ])),
                )));
  }
}
