import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        update();
      });
    animationController.forward();

   
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
