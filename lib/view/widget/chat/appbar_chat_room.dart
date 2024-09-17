import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';

class AppBarChatRoom extends StatelessWidget {
  AppBarChatRoom({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: AppColor.praimaryColor,
      leadingWidth: 100,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        borderRadius: BorderRadius.circular(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 5,
            ),
            Icon(Icons.arrow_back, color: AppColor.white),
            SizedBox(
              width: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                AppImageAsset.onBoardingImgSix,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      centerTitle: false,
      title:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nussaiba ba',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.white),
          ),
          Text(
            'Nussaiba ba',
            style: TextStyle(fontSize: 14, color: AppColor.white),
          ),
        ],
      ),
    );
  }
}
