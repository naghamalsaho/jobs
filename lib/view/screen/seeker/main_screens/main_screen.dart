import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/mainscreen/main_scrren_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jobs/view/screen/company&seeker/save_page.dart';
import 'package:jobs/view/screen/floating.dart';
import 'package:jobs/view/screen/company&seeker/notifications.dart';
import 'package:jobs/view/screen/seeker/main_screens/seeker_home.dart';
import 'package:jobs/view/screen/seeker/main_screens/proposed_page.dart';

class MainScreens extends GetView<MainScreenControllerImp> {
  const MainScreens({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenControllerImp());

    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Obx(
          () => CurvedNavigationBar(
            height: 55,
            key: controller.bottomNavigationBar,
            color: AppColor.Grey2(),
            index: controller.page.value,
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: AppColor.PraimaryColor().withOpacity(0.2),
            onTap: (index) {
              controller.onItemClick(index);
            },
            items: [
              Icon(
                  controller.currentindex.value == 0
                      ? Icons.home_rounded
                      : Icons.home_outlined,
                  size: 25,
                  color: AppColor.PraimaryColor()),
              Icon(
                  controller.currentindex.value == 1
                      ? Icons.add_business
                      : Icons.add_business_outlined,
                  size: 25,
                  color: AppColor.PraimaryColor()),
              Icon(
                  controller.currentindex.value == 2
                      ? Icons.notifications
                      : Icons.notifications_none_outlined,
                  size: 25,
                  color: AppColor.PraimaryColor()),
              Icon(
                  controller.currentindex.value == 3
                      ? Icons.bookmark
                      : Icons.bookmark_outline_rounded,
                  size: 25,
                  color: AppColor.PraimaryColor()),
              Icon(
                  controller.currentindex.value == 4
                      ? Icons.chat
                      : Icons.chat_outlined,
                  size: 25,
                  color: AppColor.PraimaryColor()),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            SeekerHome(),
            ProposedPage(),
            NotificationPage(),
            JobSavedScreen(),
            MyHomePagea(),
            //ChatsApp(),
          ],
        ));
  }
}