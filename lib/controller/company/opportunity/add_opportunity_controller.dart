import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/company/create_opportunity.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';
import 'package:jobs/view/widget/company/add_opportunity/bottomsheet_opportunity.dart';

abstract class AddNewOpportunityController extends GetxController {
  getImage();
  showJobPreviewBottomSheet(BuildContext context);
  addOpportunity();
}

class AddNewOpportunityControllerImp extends AddNewOpportunityController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController title;
  late TextEditingController body;
  late TextEditingController location;
  late TextEditingController jophours;
  late TextEditingController salary;
  late TextEditingController textEditingControllerskill;
  late TextEditingController textEditingControllerqualifications;
  File? file;
  List<String> skills = [];
  List<String> qualifications = [];
  String selectedJobType = 'full_time';
  String selectedWorkPlaceType = 'on_site';
  bool isVacant = true;
  int selectedSkillIndex = -1;
  int selectedQualificationsIndex = -1;

  OpportunityData opportunityData = OpportunityData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ImageAndFileData imageData = ImageAndFileData(Get.find());

  final List<String> jobTypes = [
    'full_time',
    'part_time',
    'contract',
    'temporary',
    'volunteer',
  ];

  final List<String> workPlaceTypes = [
    'on_site',
    'hybrid',
    'remote',
  ];

  void addSkill(String skill) {
    if (skill.isNotEmpty && !skills.contains(skill)) {
      skills.add(skill);
      print(skills);
      update();
    }
  }

  void deleteSkill(int index) {
    if (index >= 0 && index < skills.length) {
      skills.removeAt(index);
      selectedSkillIndex = -1;
      update();
    }
  }

  void selectSkill(int index) {
    selectedSkillIndex = index;
    update();
  }

  void addQualifications(String qualification) {
    if (qualification.isNotEmpty && !qualifications.contains(qualification)) {
      qualifications.add(qualification);
      print(skills);
      update();
    }
  }

  void deleteQualification(int index) {
    if (index >= 0 && index < qualifications.length) {
      qualifications.removeAt(index);
      selectedQualificationsIndex = -1;
      update();
    }
  }

  void selectQualification(int index) {
    selectedQualificationsIndex = index;
    update();
  }

  void setVacant(bool value) {
    isVacant = value;
    update();
  }

  void Function(String?)? setSelectedJobType(type) {
    selectedJobType = type;
    update();
    return null;
  }

  void Function(String?)? setSelectedWorkPlaceType(type) {
    selectedWorkPlaceType = type;
    update();
    return null;
  }

  @override
  addOpportunity() async {
    print(
        " ${title.text} ..${body.text}..\n ${location.text}\n   ${selectedJobType}\n ${selectedWorkPlaceType}\ ${jophours.text}\n${qualifications}\n ${skills}\n${salary.text}\n${isVacant}");
    // if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await opportunityData.createOpportunityPostdata(
        title.text,
        body.text,
        file,
        selectedJobType,
        selectedWorkPlaceType,
        jophours.text,
        qualifications,
        skills,
        salary.text,
        isVacant ? '1' : '0');
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 201) {
        Get.lazyPut<GetPostsAndOpportunityControllerImp>;
        update();
        getSnakBar("24".tr,  "${response["message"]}", 3);
        Get.offAllNamed(AppRoute.mainScreensCompany);
      } else {
  getDialog("203".tr, "${response["message"]}");        
        print(response);
      }
    }
    //}
    //else{
    // }
  }

  @override
  void showJobPreviewBottomSheet(context) {
    Get.bottomSheet(
      BottomSheetOpportunity(
        image: file,
        title: title.text,
        body: body.text,
        location: location.text,
        jobType: selectedJobType,
        workPlaceType: selectedWorkPlaceType,
        jobHours: jophours.text,
        qualifications: qualifications,
        skills: skills,
        salary: salary.text,
        vacant: isVacant.toString(),
        onPressedBack: () {
          Get.back();
        },
        onPressedPublish: () {
          addOpportunity();
        },
      ),
      isScrollControlled: true,
    );
  }

  @override
  getImage() async {
    file = await imageData.getImageData();
    update();
  }

  @override
  void onInit() {
    title = TextEditingController();
    body = TextEditingController();
    location = TextEditingController();
    jophours = TextEditingController();
    salary = TextEditingController();
    textEditingControllerskill = TextEditingController();
    textEditingControllerqualifications = TextEditingController();
    title.addListener(() {
      final text = title.text.toLowerCase();
      title.value = title.value.copyWith(
          text: text,
          selection: TextSelection(
              baseOffset: text.length, extentOffset: text.length));
    });
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    location.dispose();
    jophours.dispose();
    salary.dispose();

    textEditingControllerqualifications.dispose();
    textEditingControllerskill.dispose();

    super.dispose();
  }

  @override
  void onClose() {
    if (file != null) {
      file!.delete();
    }
    super.onClose();
  }
}

extension StringExtension on String {
  String get capitalizeFirst =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
}
