import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/splash_controller.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/view/widget/auth/logoauth.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const LogoAuth(),
             
            FadeTransition(
              opacity: splashController.animation,
              child: 
              Lottie.asset(AppImageAsset.loadingliner),
            ),
          ],
        ),
      ),
    );
  }
}
