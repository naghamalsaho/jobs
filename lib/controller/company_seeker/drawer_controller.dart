import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/localization/changelocal.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';
import 'package:jobs/controller/settings/logout_controller.dart';
import 'package:jobs/data/model/company.dart';
import 'package:jobs/data/model/seeker.dart';
import 'package:jobs/view/screen/settings_pages/account_settings.dart';

class CustomDrawerController extends GetxController {
  var isDrawerOpen = false.obs;
  final logOutController = Get.put(LogoutControllerImp());
  String? lang;
  MyServices myServices = Get.find();
  LocalController langCon = Get.find();
  late String account;
  late String username;
  late String email;
  late String id;
  late String? image;
  late bool? dark;
  SeekerModel? seekerModel;
  CompanyModel? companyModel;
  final profileController = Get.put(GetUserController());
  add() {
    account == 'company'
        ? Get.offAndToNamed(AppRoute.addOpportunity)
        : Get.offAndToNamed(AppRoute.postpage);
  }

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  toggleDarkMode() {
    print(myServices.box.read("theme"));
    bool? isDarkMode = myServices.box.read("theme");
    if (isDarkMode == false || isDarkMode == null) {
      isDarkMode = true;
    } else {
      isDarkMode = false;
    }

    print("isDarkMode ${isDarkMode}");

    langCon.changeTheme(isDarkMode);
    update();
  }

  goToProfile() {
    profileController.getUser(int.parse(id));
  }

  setLang() {
    Get.defaultDialog(
        backgroundColor: AppColor.White(),
        title: "1000".tr,
        titleStyle: TextStyle(color: AppColor.TextColor()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                title: Text(
                  "English",
                  style: TextStyle(color: AppColor.IconColor(), fontSize: 16),
                ),
                onTap: () {
                  langCon.changeLanguage("en");

                  update();
                  Get.back();
                }),
            ListTile(
                title: Text(
                  "اللغة العربية",
                  style: TextStyle(color: AppColor.IconColor(), fontSize: 16),
                ),
                onTap: () {
                  langCon.changeLanguage("ar");
                  update();
                  Get.back();
                }),
          ],
        ));
  }

  goToApplies() {
    account == 'company'
        ? Get.offAndToNamed(AppRoute.allAppliesCompany)
        : Get.offAndToNamed(AppRoute.appliesSeeker);
  }

  goToSaved() {
    Get.offAndToNamed(AppRoute.savedJobs);
  }

  profile() {
    Get.toNamed(AppRoute.accountSettings);
  }

  logout() {
    logOutController.logout();
  }

  @override
  void onInit() async {
    lang = myServices.box.read("lang");
    account = myServices.box.read("account");
    username = myServices.box.read("user_name");
    email = myServices.box.read("email");
    id = myServices.box.read("id");
    image = myServices.box.read("image");
    dark = myServices.box.read("theme");

    account == 'company'
        ? companyModel = await profileController.getUserInfo(int.parse(id))
        : seekerModel = await profileController.getUserInfo(int.parse(id));
    account == 'company'
        ? myServices.box.write("companyModel", companyModel)
        : myServices.box.write("seekerModel", seekerModel);
    update();
    print("$lang  ssssssssssssssssssss  lang");
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
