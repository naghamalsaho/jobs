import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
       backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        title: Text(
          "16".tr,
          style: TextStyle(color: AppColor.white),
        ),
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
        backgroundColor: AppColor.PraimaryColor(),
      ),
        
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: [
                        CustomTextTitle(
                          text: "32".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBody(text: "29".tr),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 8, 50, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          labeltext: "13".tr,
                          iconData: Icons.email_outlined,
                        ),
                        CustomButtomAuth(
                            color: AppColor.praimaryColor,
                            text: "33".tr,
                            onPressed: () {
                              controller.checkemail();
                              //   Get.offNamed(
                              //     AppRoute.verfiyCodeForgetpassword,
                              //       arguments: {"email": controller.email.text});
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                      ]),
                    ),
                  ),
                )));
  }
}
