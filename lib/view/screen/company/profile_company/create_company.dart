import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company/profile_company/create_profile_company.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_drop_search.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import 'package:jobs/view/widget/general/custom_text_field.dart';
import 'package:jobs/view/widget/general/Custom_choose_image.dart';

class CreateProfilePageCompany extends StatelessWidget {
  CreateProfilePageCompany({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProfileCompanyControllerImp());

    return Scaffold(
        backgroundColor: AppColor.Backgroundcolor(),
        body: GetBuilder<CreateProfileCompanyControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: alertExitApp,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          "68".tr,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      FadeAnimation(CustomTextBody(text: "69".tr), 0.3),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          CustomChooseImage(
                            onTap: () {
                              controller.getImage();
                            },
                            image: controller.image,
                          ),
                          0.5),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.business,
                            label: "70".tr,
                            hint: "71".tr,
                            mycontroller: controller.companyname,
                          ),
                          1),
                      FadeAnimation(
                          CustomDropDownSearch(
                            selectedItem: controller.selectedCountry,
                            label: "72".tr,
                            hint: "73".tr,
                            items: controller.countries.map((country) {
                              return country.county;
                            }).toList(),
                            icon: Icons.location_on,
                            onChanged: controller.setSelectedCountry,
                          ),
                          1.5),
                      FadeAnimation(
                          CustomDropDownSearch(
                            selectedItem: controller.selectedCity,
                            label: "74".tr,
                            hint: "75".tr,
                            items: controller.cities.map((city) {
                              return city.name;
                            }).toList(),
                            icon: Icons.home_work,
                            onChanged: controller.setSelectedCiTy,
                          ),
                          2),
                      FadeAnimation(
                          CustomDropDownSearch(
                            label: "76".tr,
                            hint: "77".tr,
                            items: controller.domain,
                            icon: Icons.work_outline,
                            onChanged: controller.setSelectedDomain,
                          ),
                          2),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.info_outline,
                            label: "78".tr,
                            hint: "79".tr,
                            mycontroller: controller.about,
                          ),
                          2.5),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.email,
                            label: "13".tr,
                            hint: "12".tr,
                            mycontroller: controller.contactInfoEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          3),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.phone,
                            label: "244".tr,
                            hint: "245".tr,
                            mycontroller: controller.contactInfoPhone,
                            keyboardType: TextInputType.phone,
                          ),
                          3.1),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.code,
                            label: "246".tr,
                            hint: "247".tr,
                            mycontroller: controller.contactInfoGitHub,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          3.2),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.web,
                            label: "248".tr,
                            hint: "249".tr,
                            mycontroller: controller.contactInfoWebSite,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          3.3),
                      const SizedBox(height: 30),
                      FadeAnimation(
                          ElevatedButton(
                            onPressed: () {
                              controller.createProfile();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "82".tr,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          4),
                    ],
                  ),
                ),
              )),
        ));
  }
}
