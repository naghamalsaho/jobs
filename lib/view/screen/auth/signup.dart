import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/google_sign_in_controller.dart';
import 'package:jobs/controller/auth/signup_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/auth/logoauth.dart';
import 'package:jobs/view/widget/auth/textsignup.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import '../../widget/auth/custombuttomauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    Get.put(AuthWithGoogle());

    return Scaffold(
     
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: alertExitApp,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                      FadeAnimation(
                        CustomTextTitle(
                          text: "18".tr,
                        ),
                        0.1),
                    FadeAnimation( const LogoAuth(), 0.2),
                  
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(CustomTextBody(text: "19".tr), 0.4),
                    const SizedBox(
                      height: 15,
                    ),
                    FadeAnimation(
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 5, 20, "username");
                          },
                          mycontroller: controller.username,
                          hinttext: "20".tr,
                          labeltext: "21".tr,
                          iconData: Icons.person_outline,
                        ),
                        0.8),
                    FadeAnimation(
                        CustomTextFormAuth(
                          valid: (val) {
                            return validInput(val!, 5, 50, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          labeltext: "13".tr,
                          iconData: Icons.email_outlined,
                        ),
                        1.0),
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
                        1.3),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        CustomButtomAuth(
                            color: AppColor.praimaryColor,
                            text: "18".tr,
                            onPressed: () {
                              controller.ChooseAccountType();
                            }),
                        1.5),
                    const SizedBox(
                      height: 5,
                    ),
                    GetBuilder<AuthWithGoogle>(
                      builder: (controller) => FadeAnimation(
                          CustomButtomAuth(
                              color: AppColor.praimaryColor,
                              text: "Google",
                              onPressed: () async {
                                print("llllllll");
                                await controller
                                    .loginWithGoogle()
                                    .whenComplete(() => debugPrint('DONE'));
                              }),
                          1.8),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        CustomTextSignUpOrSignIn(
                          textone: "22".tr,
                          texttwo: "9".tr,
                          onTap: () {
                            controller.goToSignIn();
                          },
                        ),
                        2.2),
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
