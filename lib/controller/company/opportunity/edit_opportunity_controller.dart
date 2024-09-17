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
import 'package:jobs/data/datasource/remote/general/convert_image_to_file.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import 'package:jobs/view/widget/company/add_opportunity/bottomsheet_opportunity.dart';

abstract class EditNewOpportunityController extends GetxController {
  getImage();
  showJobPreviewBottomSheet(BuildContext context);
  editOpportunity(int id);
}

class EditNewOpportunityControllerImp extends EditNewOpportunityController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late OpportunityModel opportuntiyModel;
  late TextEditingController title;
  late TextEditingController body;
  late TextEditingController location;
  late TextEditingController jophours;
  late TextEditingController salary;
  late TextEditingController textEditingControllerskill;
  late TextEditingController textEditingControllerqualifications;
 
  List<String> skills = [];
  List<String> qualifications = [];
  String? selectedJobType;
  String? selectedWorkPlaceType;
  bool isVacant = true;
  int selectedSkillIndex = -1;
  int selectedQualificationsIndex = -1;
  OpportunityData opportunityData = OpportunityData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ImageAndFileData imageData = ImageAndFileData(Get.find());
  FileData fileData = FileData(Get.find());
 File? file;
  String? filePath;
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
      // Reset the selected index
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
  editOpportunity(int id) async {
    print(
        " ${title.text} ..${body.text}..\n ${location.text}\n   ${selectedJobType}\n ${selectedWorkPlaceType}\ ${jophours.text}\n${qualifications}\n ${skills}\n${salary.text}\n${isVacant}");
    // if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await opportunityData.editOpportunityPostdata(
        id,
        title.text,
        body.text,
        file == null && filePath != null
            ? await fileData.downloadImage(filePath!, 'img.jpg')
            : file != null
                ? file!
                : null,
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
        // var update1 =
        Get.lazyPut<GetPostsAndOpportunityControllerImp>;
        update();
        getSnakBar("24".tr,  "${response["message"]}" , 3);
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
        jobType: selectedJobType!,
        workPlaceType: selectedWorkPlaceType!,
        jobHours: jophours.text,
        qualifications: qualifications,
        skills: skills,
        salary: salary.text,
        vacant: isVacant.toString(),
        onPressedBack: () {
          Get.back();
        },
        onPressedPublish: () {
          editOpportunity(opportuntiyModel.id!);
        },
      ),
      isScrollControlled: true,
    );
  }

  @override
  getImage() async {
    file = await imageData.getImageData();
    filePath = null;
    update();
  }

  @override
  void onInit() {
    opportuntiyModel = Get.arguments['opportuntiyModel'];
    title = TextEditingController(text: opportuntiyModel.title);
    body = TextEditingController(text: opportuntiyModel.body);
    location = TextEditingController(text: opportuntiyModel.location);
    jophours = TextEditingController(text: opportuntiyModel.jophours);
    salary = TextEditingController(text: opportuntiyModel.salary);
    qualifications =
        opportuntiyModel.qualifications!.map((i) => i.toString()).toList();
    skills = opportuntiyModel.skills!.map((i) => i.toString()).toList();
    textEditingControllerskill = TextEditingController();
    textEditingControllerqualifications = TextEditingController();
    selectedJobType = opportuntiyModel.jopType!;
    selectedWorkPlaceType = opportuntiyModel.workPlaceType!;
   filePath = opportuntiyModel.images;
    print(
        "fffffffffffffffffffffffffff$filePath $file fffffffffffffffffffffffffffff");
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
