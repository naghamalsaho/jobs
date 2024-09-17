import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/onboarding/onboardingcontroller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/onboarding/customslider.dart';
import 'package:jobs/view/widget/onboarding/dotonboarding.dart';
import 'package:jobs/view/widget/onboarding/buttononboarding.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: Stack(children: [
        Container(
          color: AppColor.praimaryColor,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(80))),
                child: const Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: CustomSliderOnBoarding(),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomDotControllerOnBoarding(),
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
          right: controller.lang == 'en' ? -20 : null,
          left: controller.lang == 'ar' ? -20 : null,
          bottom: -25,
          child: CustomButtonOnBoarding(),
        ),
      ]),
    );
  }
}
