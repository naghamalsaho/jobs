import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/login_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/auth/logoauth.dart';
import 'package:jobs/view/widget/auth/textsignup.dart';
import '../../widget/auth/custombuttomauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: AppColor.PraimaryColor(),
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 55, 32, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "9".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: AppColor.White()),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "10".tr,
                  style: TextStyle(color: AppColor.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        GetBuilder<LoginControllerImp>(
            builder: (controller) => Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * 0.78,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(35)),
                  ),
                  padding: EdgeInsets.all(12.0),
                  //  decoration: const BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage(
                  //               AppImageAsset.background2),
                  //           fit: BoxFit.cover)),
                  child: HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: WillPopScope(
                      onWillPop: alertExitApp,
                      child: Form(
                        key: controller.formstate,
                        child: ListView(children: [
                          const LogoAuth(),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(CustomTextBody(text: "11".tr), 0.5),
                          const SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                              CustomTextFormAuth(
                                valid: (val) {
                                  return null;
                                },
                                mycontroller: controller.email,
                                hinttext: "243".tr,
                                labeltext: "242".tr,
                                iconData: Icons.email_outlined,
                              ),
                              1),
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
                              1.5),
                          FadeAnimation(
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "16".tr,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: AppColor.Grey()),
                                ),
                              ),
                              2),
                          FadeAnimation(
                              CustomButtomAuth(
                                  color: AppColor.praimaryColor,
                                  text: "9".tr,
                                  onPressed: () {
                                    //  Get.offNamed(AppRoute.log);
                                    controller.login();
                                  }),
                              2.5),
                          const SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              CustomTextSignUpOrSignIn(
                                  textone: "17".tr,
                                  texttwo: "18".tr,
                                  onTap: () {
                                    controller.goToSignUp();
                                  }),
                              3),
                        ]),
                      ),
                    ),
                  ),
                ))),
      ],
    ));
  }
}
