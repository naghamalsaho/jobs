import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company/profile_company/edit_company.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/Custom_choose_image.dart';
import 'package:jobs/view/widget/general/custom_text_field.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';

import '../../../widget/general/custom_drop_search.dart';

class EditProfilePageCompany extends StatelessWidget {
  const EditProfilePageCompany({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateProfileCompanyControllerImp());

    return Scaffold(
      backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        backgroundColor: AppColor.PraimaryColor(),
        elevation: 0.0,
        title: Text(
          "83".tr,
          style: TextStyle(color: AppColor.white),
        ),
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
      ),
      body: GetBuilder<UpdateProfileCompanyControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              FadeAnimation(CustomTextBody(text: "84".tr), 0.3),
              const SizedBox(
                height: 10,
              ),
              FadeAnimation(
                  (controller.imagepathSave != null && controller.image == null)
                      ? Center(
                          child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColor.praimaryColor),
                                  color: Colors.deepPurple.shade50,
                                  borderRadius: BorderRadius.circular(50)),
                              child: InkWell(
                                onTap: () {
                                  controller.getImage();
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image.network(
                                      "${AppLink.serverimage}/${controller.imagepathSave}",
                                      fit: BoxFit.cover,
                                    )),
                              )),
                        )
                      : CustomChooseImage(
                          onTap: () {
                            controller.getImage();
                          },
                          image: controller.image,
                        ),
                  0.6),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              FadeAnimation(
                  CustomTextFieldInfo(
                    icon: Icons.business,
                    label: "70".tr,
                    hint: "71".tr,
                    mycontroller: controller.namecompany,
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
                    selectedItem: controller.selectedDomain,
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
              CustomButtomAuth(
                  color: AppColor.praimaryColor,
                  text: "141".tr,
                  onPressed: () {
                    controller.updateProfile();
                  }),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
