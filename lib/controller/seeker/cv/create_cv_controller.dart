import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/view/widget/general/custom_button_with_icon.dart';
import 'package:lottie/lottie.dart';
import 'package:open_file/open_file.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/crud.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/seeker/cv/cv_data.dart';
import 'package:path_provider/path_provider.dart';

class CreateCvController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CvData cvData = CvData(Get.put(Crud()));
  MyServices myServices = Get.find();

  late TextEditingController full_name;
  late TextEditingController birth_day;
  late TextEditingController location;
  late TextEditingController about;

  late List<TextEditingController> language;
  late List<TextEditingController> skill;
  late List<TextEditingController> certificate;
  late List<TextEditingController> project;
  late List<TextEditingController> experience;
  late List<TextEditingController> contact;
  late List<TextEditingController> profile;
  var focuseslanguages = <FocusNode>[].obs;
  var focusesskills = <FocusNode>[].obs;
  var focusescertificates = <FocusNode>[].obs;
  var focusesprojects = <FocusNode>[].obs;
  var focusesexperiences = <FocusNode>[].obs;
  var focusescontacts = <FocusNode>[].obs;
  var focusesprofile = <FocusNode>[].obs;

  void addLanguages(List<TextEditingController> list) {
    var flanguage = FocusNode();
    focuseslanguages.add(flanguage);
    list.add(TextEditingController());

    update();
    Future.delayed(const Duration(milliseconds: 100), () {
      flanguage.requestFocus();
    });
  }

  void addSkills(List<TextEditingController> list) {
    var fskills = FocusNode();
    focusesskills.add(fskills);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fskills.requestFocus();
    });
  }

  void addcertificates(List<TextEditingController> list) {
    var fcertificates = FocusNode();
    focusescertificates.add(fcertificates);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fcertificates.requestFocus();
    });
  }

  void addprojects(List<TextEditingController> list) {
    var fprojects = FocusNode();
    focusesprojects.add(fprojects);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fprojects.requestFocus();
    });
  }

  void addexperiences(List<TextEditingController> list) {
    var fexperiences = FocusNode();
    focusesexperiences.add(fexperiences);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fexperiences.requestFocus();
    });
  }

  void addcontacts(List<TextEditingController> list) {
    var fcontacts = FocusNode();
    focusescontacts.add(fcontacts);
    list.add(TextEditingController());
    update();
    Future.delayed(Duration(milliseconds: 100), () {
      fcontacts.requestFocus();
    });
  }

  createcv() async {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await cvData.postCvData(
        full_name.text,
        birth_day.text,
        location.text,
        about.text,
        skill,
        certificate,
        language,
        project,
        experience,
        contact);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      final bytes = response.bodyBytes;
      print(bytes);
      final buffer = bytes.buffer;
      print(buffer);
      final appStore =
          await getExternalStorageDirectory().whenComplete(() => print('LLLL'));
      final docpath = appStore!.path;
      print(docpath);
      File fileCv = File('$docpath/cv.pdf');
      print(fileCv);
      await fileCv.writeAsBytes(buffer.asUint8List());
      print(fileCv);
      open(fileCv);
      // await OpenFile.open(fileCv.path).whenComplete(() => print("CV"));
      update();
    } else {
      getDialog("203".tr, "218".tr);
    }
  }

  open(File file) {
    Get.defaultDialog(
        backgroundColor: AppColor.Backgroundcolor(),
        title: "217".tr,
        titleStyle: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: AppColor.TextColor(),
          letterSpacing: 1.5,
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        content: Column(
          children: [
            Center(
              child: Lottie.asset(AppImageAsset.cv, width: 250, height: 250),
            ),
            CustomButtonWithIcon(
              onPressed: () async {
                await OpenFile.open(file.path).whenComplete(() => print("CV"));

                update();
                Get.back();
              },
              icon: Icons.attach_file,
              title: "119".tr,
            ),
          ],
        ));
  }

  @override
  void onInit() {
    full_name = TextEditingController();
    birth_day = TextEditingController();
    location = TextEditingController();
    about = TextEditingController();

    language = <TextEditingController>[].obs;
    skill = <TextEditingController>[].obs;
    certificate = <TextEditingController>[].obs;
    project = <TextEditingController>[].obs;
    experience = <TextEditingController>[].obs;
    contact = <TextEditingController>[].obs;
    profile = <TextEditingController>[].obs;

    super.onInit();
  }

  @override
  void dispose() {
    full_name.dispose();
    birth_day.dispose();
    location.dispose();
    about.dispose();

    for (var element in focuseslanguages) {
      element.dispose();
    }
    for (var element in language) {
      element.dispose();
    }
    project.forEach((element) {
      element.dispose();
    });
    skill.forEach((element) {
      element.dispose();
    });

    super.dispose();
  }
}
