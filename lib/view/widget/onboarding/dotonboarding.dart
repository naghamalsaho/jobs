import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/onboarding/onboardingcontroller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/data/datasource/static/onboardinglist.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(
                right: controller.lang == 'ar' ? 35 : 0,
                left: controller.lang == 'en' ? 35 : 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                      margin: const EdgeInsets.only(right: 8),
                      duration: const Duration(milliseconds: 900),
                      width: controller.currentPage == index ? 18 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: controller.currentPage == index
                              ? AppColor.praimaryColor
                              : AppColor.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ));
  }
}
