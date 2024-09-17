import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/account_settings_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/company&seeker/setting_page/setting_item..dart';

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountSettingsController());
    return Scaffold(
      backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        title: Text(
          "160".tr,
          style: TextStyle(color: AppColor.white),
        ),
        backgroundColor: AppColor.PraimaryColor(),
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                controller.goToProfile();
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: controller.image != null
                        ? NetworkImage(
                            "${AppLink.serverimage}/${controller.image}")
                        : null,
                    radius: 46,
                    child: controller.image != null
                        ? null
                        : Icon(Icons.account_circle, size: 85),
                  ),
                  SizedBox(height: 10),
                  Text(
                      controller.account == 'company'
                          ? controller.companyModel!.company_name!
                          : "${controller.seekerModel!.first_name!} ${controller.seekerModel!.last_name!} ",
                      style: TextStyle(
                        color: AppColor.TextColor(),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.8
                      ),
                      ),
                  Text(controller.email,
                      style: TextStyle(
                        color: AppColor.TextColor(),
                        fontSize: 16,
                        
                      ),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Divider(
              endIndent: 30,
              indent: 30,
              height: 10,
              color: AppColor.Grey(),
            ),
          ),
          SettingsItem(
            text: "151".tr,
            icon: Icons.edit,
            onTap: () {
              controller.goToEditProfilePage();
            },
          ),
          SettingsItem(
            text: "161".tr,
            icon: Icons.lock,
            onTap: () {
              Get.toNamed(AppRoute.checkPassword);
            },
          ),
          SettingsItem(
            text: "152".tr,
            icon: Icons.delete,
            onTap: () {
              Get.toNamed(AppRoute.deleteAccount);
            },
          ),
        ],
      ),
    );
  }
}