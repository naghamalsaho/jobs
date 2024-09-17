import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/onboarding/onboardingcontroller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/data/datasource/static/onboardinglist.dart';
import 'package:lottie/lottie.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Lottie.asset(
                    onBoardingList[i].image!,
                    width: 280,
                    height: 260,
                    //  fit : BoxFit.cover
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    onBoardingList[i].title!,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: AppColor.praimaryColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        onBoardingList[i].body!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            height: 1.5,  fontSize: 20),
                      )),
                ],
              ),
            ));
  }
}
