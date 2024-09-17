import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/static/onboardinglist.dart';

abstract class OnBoardingController extends GetxController {
  nextPage();
  onPageChanged(int indexpage);
  toggle(bool press);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();
  var isPress = false;
 late String lang;
  @override
  void toggle(bool press) {
    isPress = press;
    update();
  }

  @override
  nextPage() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.box.write("step", "1");
      Get.offAllNamed(AppRoute.signUp);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 700), curve: Curves.bounceIn);
    }
  }

  @override
  onPageChanged(int indexpage) {
    currentPage = indexpage;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    lang = myServices.box.read("lang");
    print("$lang  lang");
    super.onInit();
  }
}
