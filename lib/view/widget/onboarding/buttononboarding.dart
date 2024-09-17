import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/onboarding/onboardingcontroller.dart';
import 'package:jobs/core/constants/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      init: controller,
      builder: (_) => InkWell(
        onTap: () {
          controller.nextPage();
        },
        onHighlightChanged: controller.toggle,
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(microseconds: 100),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: controller.isPress ? 16 : 1,
                color: controller.isPress
                    ? AppColor.praimaryColor.withOpacity(0.5)
                    : AppColor.praimaryColor,
                blurRadius: controller.isPress ? 24 : 0,
              )
            ],
            color: controller.isPress
                ? AppColor.praimaryColor.withOpacity(0.1)
                : AppColor.praimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(180)),
          ),
          child: const Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
