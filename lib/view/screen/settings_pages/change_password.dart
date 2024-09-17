import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/settings/change_password_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import '../../widget/auth/custombuttomauth.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordControllerImp());

    return Scaffold(
       backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        backgroundColor: AppColor.PraimaryColor(),
        title: Text("161".tr,
         style: TextStyle(color: AppColor.White()),
        ),
      
        iconTheme: IconThemeData(color: AppColor.White()),
      ),
  
      body: GetBuilder<ChangePasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    FadeAnimation(
                        CustomTextTitle(
                          text: "161".tr,
                        ),
                        0.2),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(CustomTextBody(text: "162".tr), 0.4),
                    const SizedBox(
                      height: 15,
                    ),
                    FadeAnimation(
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
                        0.8),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        CustomTextFormAuth(
                          valid: (value) {
                            return isPasswordCompliant(value!);
                          },
                          mycontroller: controller.password_confirmation,
                          hinttext: "163".tr,
                          labeltext: "164".tr,
                          iconData: controller.isShowRePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: controller.isShowRePassword,
                          onTapIcon: () {
                            controller.showRePassWord();
                          },
                        ),
                        1.2),
                    FadeAnimation(
                        CustomButtomAuth(
                            color: AppColor.praimaryColor,
                            text: "161".tr,
                            onPressed: () {
                              controller.changePassword();
                            }),
                        1.5),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
                )),
          ),
        ),
      
    );
  }
}
