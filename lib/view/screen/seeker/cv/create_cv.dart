import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/cv/create_cv_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/cv/fields_cv.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import '../../../widget/cv/title_item_cv.dart';

class CreateCV extends StatelessWidget {
  CreateCV({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(CreateCvController());

    return Scaffold(

       backgroundColor: AppColor.Backgroundcolor(),
        appBar: AppBar(
            title: Text(
              "194".tr,
              style: TextStyle(color: AppColor.White()),
            ),
            iconTheme: IconThemeData(
              color: AppColor.White(),
            ),
            backgroundColor: AppColor.PraimaryColor()),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<CreateCvController>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Column(children: [
                SizedBox(
                  height: 12,
                ),
              
                CustomTextTitle(
                  text: "194".tr,
                ),
               
                CustomTextBody(text: "226".tr),
                 SizedBox(
                  height: 20,
                ),
                  Center(
                  child: Image.asset(AppImageAsset.cv4,
                      width: 200, height: 200),
                ),
                 SizedBox(
                  height: 20,
                ),
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 50, "username");
                        },
                        mycontroller: controller.full_name,
                        hinttext: "229".tr,
                        labeltext: "230".tr,
                        iconData: Icons.abc,
                      ),
                      CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 5, 50, "username");
                    },
                    mycontroller: controller.birth_day,
                    hinttext: "231".tr,
                    labeltext: "128".tr,
                    iconData: Icons.abc,
                  ),
                  CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 5, 50, "username");
                    },
                    mycontroller: controller.location,
                    hinttext: "148".tr,
                    labeltext: "232".tr,
                    iconData: Icons.abc,
                  ),
                  CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 5, 50, "username");
                    },
                    mycontroller: controller.about,
                    hinttext: "135".tr,
                    labeltext: "136".tr,
                    iconData: Icons.abc,
                  ),
                    ],
                  ),
                ),
              
                
                //languages
                titleItemCv(
                  itemName: "219".tr,
                  onPressed: () {
                    con.addLanguages(con.language);
                  },
                  icon: Icons.language,
                ),
                FieldsCV(
                  fff: con.focuseslanguages,
                  list: con.language,
                  text: "220".tr,
                ),
                //skills
                titleItemCv(
                  itemName: "59".tr,
                  onPressed: () {
                    con.addSkills(con.skill);
                  },
                  icon: Icons.build,
                ),
                FieldsCV(
                  list: con.skill,
                  text: "59".tr,
                  fff: con.focusesskills,
                ),
              
                //projects
                titleItemCv(
                  itemName: "221".tr,
                  onPressed: () {
                    con.addprojects(con.project);
                  },
                  icon: Icons.work,
                ),
                FieldsCV(
                  list: con.project,
                  text: "222".tr,
                  fff: con.focusesprojects,
                ),
                /////certificates
                titleItemCv(
                  itemName: "131".tr,
                  onPressed: () {
                    con.addcertificates(con.certificate);
                  },
                  icon: Icons.card_membership,
                ),
              
                FieldsCV(
                  list: con.certificate,
                  text: "223".tr,
                  fff: con.focusescertificates,
                ),
                // experiences
              
                titleItemCv(
                  itemName: "224".tr,
                  onPressed: () {
                    con.addexperiences(con.experience);
                  },
                  icon: Icons.timeline,
                ),
                FieldsCV(
                    list: con.experience,
                    text: "225".tr,
                    fff: con.focusesexperiences),
              
                /////contacts
                titleItemCv(
                  itemName: "80".tr,
                  onPressed: () {
                    // con.profile.add(TextEditingController());
                    con.addcontacts(con.contact);
                    print("${con.contact}");
                  },
                  icon: Icons.contacts,
                ),
                FieldsCV(
                    list: con.contact,
                    text: "80".tr,
                    fff: con.focusescontacts),
                CustomButtomAuth(
                  color: AppColor.PraimaryColor(),
                  text: "194".tr,
                  onPressed: () {
                    con.createcv();
                  },
                ),
              ]),
            ),
          ),
        ));
  }
}

class TextFieldCV extends StatelessWidget {
  const TextFieldCV({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      style:
          TextStyle(color: AppColor.TextColor(), fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: "text",
        prefixIcon: Icon(
          Icons.remove_circle,
          color: AppColor.Grey(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.praimaryColor,
            )),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),

      onChanged: (val) {},
      //  controller: list[i],
    );
  }
}
