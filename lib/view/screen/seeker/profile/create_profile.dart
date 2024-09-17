import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/profile/create_profile_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/company/add_opportunity/custom_warp.dart';
import 'package:jobs/view/widget/general/Custom_choose_image.dart';
import 'package:jobs/view/widget/general/custom_drop_search.dart';
import 'package:jobs/view/widget/general/custom_dropdown_button.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_field.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import 'package:jobs/view/widget/profile/create_profile_widgets/custom_date.dart';

class CreateProfilePage extends StatelessWidget {
  const CreateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProfileControllerImp());

    return Scaffold(
      backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        elevation: 0.0,
        title: Text(
          "122".tr,
          style: TextStyle(color: AppColor.White()),
        ),
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
      ),
      body: GetBuilder<CreateProfileControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
              onWillPop: alertExitApp,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                 const SizedBox(
                      height: 5,
                    ),   
                    FadeAnimation(CustomTextBody(text: "123".tr), 0.6),
                    const SizedBox(
                      height: 15,
                    ),
                    FadeAnimation(
                        CustomChooseImage(
                          onTap: () {
                            controller.getImage();
                          },
                          image: controller.image,
                        ),
                        1.1),
                    const SizedBox(height: 10),
                    FadeAnimation(
                        CustomTextFieldInfo(
                          icon: Icons.person_outline,
                          label: "124".tr,
                          hint: "125".tr,
                          mycontroller: controller.firstname,
                          valid: (val) {
                            return validInput(val!, 5, 12, "username");
                          },
                        ),
                        1.2),
                    FadeAnimation(
                        CustomTextFieldInfo(
                          icon: Icons.person_outline,
                          label: "126".tr,
                          hint: "127".tr,
                          mycontroller: controller.lastname,
                          valid: (val) {
                            return validInput(val!, 5, 12, "username");
                          },
                        ),
                        1.4),
                    FadeAnimation(
                        CustomDate(
                            text: controller.birthday1 != null
                                ? controller.birthday1!.toString().split(' ')[0]
                                : "128".tr,
                            onTap: () {
                              controller.pickBirthday(context);
                            }),
                        1.7),
                    FadeAnimation(
                        CustomDropDownSearch(
                          label: "72".tr,
                          hint: "73".tr,
                          items: controller.countries.map((country) {
                            return country.county;
                          }).toList(),
                          icon: Icons.location_on,
                          onChanged: controller.setSelectedCountry,
                        ),
                        2),
                    FadeAnimation(
                        CustomDropDownSearch(
                          label: "74".tr,
                          hint: "75".tr,
                          items: controller.cities.map((city) {
                            return city.name;
                          }).toList(),
                          icon: Icons.home_work,
                          onChanged: controller.setSelectedCiTy,
                        ),
                        2.3),
                    FadeAnimation(
                        CustomDropDownSearch(
                          label: "129".tr,
                          hint: "130".tr,
                          items: controller.specializations,
                          icon: Icons.work_outline,
                          onChanged: controller.setSelectedSpecialization,
                        ),
                        2.6),
                    FadeAnimation(
                        Column(
                          children: [
                            CustomTextFieldInfo(
                              icon: Icons.local_library,
                              label: "131".tr,
                              hint: "132".tr,
                              mycontroller:
                                  controller.textEditingControllerCertificates,
                              iconsuffix: Icons.add,
                              onPressedsuffix: () {
                                controller.addCertificates(controller
                                    .textEditingControllerCertificates.text
                                    .trim());
                                controller.textEditingControllerCertificates
                                    .clear();
                              },
                              onSubmitted: (value) {
                                controller.addCertificates(value.trim());
                                print(controller.certificates);
                                controller.textEditingControllerCertificates
                                    .clear();
                              },
                            ),
                            CustomWarp(
                              list: controller.certificates,
                              selectedIndex:
                                  controller.selectedCertificatesIndex,
                              onSelected: (index) {
                                controller.selectCertificates(index);
                                controller.textEditingControllerCertificates
                                    .text = controller.certificates[index];
                              },
                              onDelete: (index) {
                                controller.deleteCertificates(index);
                              },
                            ),
                          ],
                        ),
                        3),
                    FadeAnimation(
                        Column(
                          children: [
                            CustomTextFieldInfo(
                              icon: Icons.emoji_objects,
                              label: "59".tr,
                              hint: "134".tr,
                              mycontroller:
                                  controller.textEditingControllerskill,
                              iconsuffix: Icons.add,
                              onPressedsuffix: () {
                                controller.addSkill(controller
                                    .textEditingControllerskill.text
                                    .trim());
                                controller.textEditingControllerskill.clear();
                              },
                              onSubmitted: (value) {
                                controller.addSkill(value.trim());
                                controller.textEditingControllerskill.clear();
                              },
                            ),
                            CustomWarp(
                              list: controller.skills,
                              selectedIndex: controller.selectedSkillIndex,
                              onSelected: (index) {
                                controller.selectSkill(index);
                                controller.textEditingControllerskill.text =
                                    controller.skills[index];
                              },
                              onDelete: (index) {
                                controller.deleteSkill(index);
                              },
                            ),
                          ],
                        ),
                        3.3),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.email,
                            label: "13".tr,
                            hint: "12".tr,
                            mycontroller: controller.contactInfoEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          3.4),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.phone,
                            label: "244".tr,
                            hint: "245".tr,
                            mycontroller: controller.contactInfoPhone,
                            keyboardType: TextInputType.phone,
                          ),
                          3.5),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.code,
                            label: "246".tr,
                            hint: "247".tr,
                            mycontroller: controller.contactInfoGitHub,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          3.6),
                      FadeAnimation(
                          CustomTextFieldInfo(
                            icon: Icons.web,
                            label: "248".tr,
                            hint: "249".tr,
                            mycontroller: controller.contactInfoWebSite,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          3.7),
                    FadeAnimation(
                        CustomTextFieldInfo(
                          icon: Icons.perm_device_information,
                          label: "135".tr,
                          hint: "136".tr,
                          mycontroller: controller.about,
                        ),
                        3.8),
                    FadeAnimation(
                        CustomDropDownButton(
                          label: "137".tr,
                          hint: "138".tr,
                          items: controller.gender,
                          selectedItem: controller.selectedGender,
                          icon: Icons.work,
                          onChanged: controller.setSelectedGender,
                        ),
                        3.9),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        CustomButtomAuth(
                            text: "122".tr,
                            color: AppColor.praimaryColor,
                            onPressed: () {
                              controller.createProfile();
                            }),
                        4),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),
                ),
              )),
        ),
      ),
    );
  }
}
