import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company/opportunity/edit_opportunity_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_dropdown_button.dart';
import 'package:jobs/view/widget/company/add_opportunity/custom_switch.dart';
import 'package:jobs/view/widget/general/custom_text_field.dart';
import 'package:jobs/view/widget/general/Custom_choose_image.dart';
import 'package:jobs/view/widget/general/custom_button.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import '../../../widget/company/add_opportunity/custom_warp.dart';

class EditJobOpportunityScreen extends StatelessWidget {
  const EditJobOpportunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditNewOpportunityControllerImp());
    return Scaffold(
      backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        title: Text(
          "66".tr,
          style: TextStyle(color: AppColor.white),
        ),
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
        backgroundColor: AppColor.PraimaryColor(),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GetBuilder<EditNewOpportunityControllerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                FadeAnimation(CustomTextBody(text: "67".tr), 0.3),
                const SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    (controller.filePath != null && controller.file == null)
                        ? Center(
                            child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: AppColor.PraimaryColor()),
                                    color: Colors.deepPurple.shade50,
                                    borderRadius: BorderRadius.circular(50)),
                                child: InkWell(
                                  onTap: () {
                                    controller.getImage();
                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        "${AppLink.serverimage}/${controller.filePath}",
                                        fit: BoxFit.cover,
                                      )),
                                )),
                          )
                      
                        : CustomChooseImage(
                            onTap: () {
                              controller.getImage();
                            },
                            image: controller.file,
                          )
                   
                    ,
                    0.6),
                FadeAnimation(
                    CustomTextFieldInfo(
                      icon: Icons.title,
                      label: "49".tr,
                      hint: "50".tr,
                      mycontroller: controller.title,
                      valid: (val) {
                        return validInputIsEmpty(val!);
                      },
                    ),
                    1),
                FadeAnimation(
                    CustomTextFieldInfo(
                      icon: Icons.info_outline,
                      label: "51".tr,
                      hint: "52".tr,
                      mycontroller: controller.body,
                      valid: (val) {
                        return validInputIsEmpty(val!);
                      },
                    ),
                    1.3),
                FadeAnimation(
                    CustomTextFieldInfo(
                      icon: Icons.schedule,
                      label: "53".tr,
                      hint: "54".tr,
                      mycontroller: controller.jophours,
                      keyboardType: TextInputType.number,
                      valid: (val) {
                        return validInputIsEmpty(val!);
                      },
                    ),
                    1.6),
                FadeAnimation(
                    CustomTextFieldInfo(
                      icon: Icons.attach_money,
                      label: "55".tr,
                      hint: "56".tr,
                      mycontroller: controller.salary,
                      keyboardType: TextInputType.number,
                      valid: (val) {
                        return validInputIsEmpty(val!);
                      },
                    ),
                    2),
                FadeAnimation(
                    Column(
                      children: [
                        CustomTextFieldInfo(
                          icon: Icons.local_library,
                          label: "57".tr,
                          hint: "58".tr,
                          mycontroller:
                              controller.textEditingControllerqualifications,
                          iconsuffix: Icons.add,
                          onPressedsuffix: () {
                            controller.addQualifications(controller
                                .textEditingControllerqualifications.text
                                .trim());
                            controller.textEditingControllerqualifications
                                .clear();
                          },
                          onSubmitted: (value) {
                            controller.addQualifications(value.trim());
                            print(controller.qualifications);
                            controller.textEditingControllerqualifications
                                .clear();
                          },
                        ),
                        CustomWarp(
                          list: controller.qualifications,
                          selectedIndex: controller.selectedQualificationsIndex,
                          onSelected: (index) {
                            controller.selectQualification(index);
                            controller.textEditingControllerqualifications
                                .text = controller.qualifications[index];
                          },
                          onDelete: (index) {
                            controller.deleteQualification(index);
                          },
                        ),
                      ],
                    ),
                    2.3),
                FadeAnimation(
                    Column(
                      children: [
                        CustomTextFieldInfo(
                          icon: Icons.emoji_objects,
                          label: "59".tr,
                          hint: "60".tr,
                          mycontroller: controller.textEditingControllerskill,
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
                    2.6),
                FadeAnimation(
                    CustomDropDownButton(
                      label: "61".tr,
                      hint: "62".tr,
                      items: controller.jobTypes,
                      selectedItem: controller.selectedJobType,
                      icon: Icons.work,
                      onChanged: controller.setSelectedJobType,
                    ),
                    3),
                FadeAnimation(
                    CustomDropDownButton(
                      label: "63".tr,
                      hint: "64".tr,
                      items: controller.workPlaceTypes,
                      selectedItem: controller.selectedWorkPlaceType,
                      icon: Icons.home_work,
                      onChanged: controller.setSelectedWorkPlaceType,
                    ),
                    3.3),
                FadeAnimation(
                    CustomSwitch(
                      value: controller.isVacant,
                      onChanged: controller.setVacant,
                    ),
                    3.6),
                FadeAnimation(
                    CustomButton(
                        title: "66".tr,
                        onPressed: () {
                          controller.showJobPreviewBottomSheet(context);
                        }),
                    4),
              ]),
            ),
          )),
    );
  }
}
