import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/successsignup_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:lottie/lottie.dart';

class SuccessSignUp extends StatelessWidget {
  SuccessSignUp({Key? key}) : super(key: key);
  final controller = Get.put(SuccessSignUpConroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.praimaryColor,
         
          title: Text(
            "24".tr,
             style: TextStyle(color: AppColor.white),
                
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Center(
              child: Lottie.asset(AppImageAsset.success, repeat: false),
            ),
            Text(
              "23".tr,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "25".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "82".tr,
                color: AppColor.praimaryColor,
                onPressed: () {
                  controller.goToProfile();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ]),
        ));
  }
}
