import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';
import 'package:jobs/data/datasource/remote/seeker/profile/profile_seeker.dart';

import '../../../data/model/country.dart';

abstract class CreateProfileController extends GetxController {
  createProfile();
  getImage();
  pickBirthday(BuildContext context);
}

class CreateProfileControllerImp extends CreateProfileController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? username;
  String? email;
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController contactInfoEmail;
  late TextEditingController contactInfoPhone;
  late TextEditingController contactInfoGitHub;
  late TextEditingController contactInfoWebSite;
  List<String> skills = [];
  List<String> certificates = [];
  late TextEditingController about;
  int selectedSkillIndex = -1;
  int selectedCertificatesIndex = -1;
  late TextEditingController textEditingControllerskill;
  late TextEditingController textEditingControllerCertificates;
  File? file;
  File? image;
  DateTime? birthday1;
  StatusRequest statusRequest = StatusRequest.none;
  ProfileData profileData = ProfileData(Get.find());
  ImageAndFileData imageData = ImageAndFileData(Get.find());

  MyServices myServices = Get.find();

  String? selectedSpecialization;
  final List<String> specializations = [
    "Information Technology and Communications",
    "Health and Medicine",
    "Education and Training",
    "Banking and Financial Services",
    "Engineering and Construction",
    "Tourism and Hospitality",
    "Media and Publishing",
    "Retail and E-commerce",
    "Energy and Environment",
    "Arts and Entertainment",
    "Real Estate and Property Development",
    "Manufacturing Industries",
    "Consulting Services",
    "Research and Development",
    "Social Services and Humanitarian Aid",
    "Legal and Law",
    "Safety and Security",
    "Agriculture and Sustainable Farming",
    "Science and Technology",
    "Social and Human Sciences",
    "Research and Development",
    "Real Estate and Property Management",
    "Food and Beverage Industries",
    "Medical Services and Healthcare",
    "Design and Creative",
    "Logistics and Supply Chain",
    "Contracts and Procurement",
    "Operations and Quality Management",
    "Environment and Sustainability",
    "Market Research and Marketing",
    "Sports and Fitness",
    "Social Work and Human Development",
    "Social and Human Sciences",
    "Space and Astronomy",
    "Security and Defense",
    "Fine Arts and Art Exhibitions",
    "Charity Work and Relief",
    "Politics and Government",
    "Smart Contracts and Decentralized Technology",
    "Gaming and Game Development"
  ];

  void Function(String?)? setSelectedSpecialization(type) {
    selectedSpecialization = type;
    update();
    return null;
  }

  String? selectedGender;
  final List<String> gender = [
    "male",
    "female",
  ];

  void Function(String?)? setSelectedGender(type) {
    selectedGender = type;
    update();
    return null;
  }

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

  void addCertificates(String certificate) {
    if (certificate.isNotEmpty && !certificates.contains(certificate)) {
      certificates.add(certificate);
      print(skills);
      update();
    }
  }

  void deleteCertificates(int index) {
    if (index >= 0 && index < certificates.length) {
      certificates.removeAt(index);
      selectedCertificatesIndex = -1;
      update();
    }
  }

  void selectCertificates(int index) {
    selectedCertificatesIndex = index;
    update();
  }

  @override
  getImage() async {
    image = await imageData.getImageData();
    update();
  }

  @override
  void pickBirthday(context) async {
    DateTime initialDate = birthday1 ?? DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.praimaryColor,
            colorScheme:  ColorScheme.light(
              primary: AppColor.praimaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != birthday1) {
      birthday1 = pickedDate;
      update();
    }
  }

  @override
  createProfile() async {
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await profileData.createPostdata(
        firstname.text,
        lastname.text,
        birthday1!.toString(),
        "$selectedCountry , $selectedCity",
        image,
        skills,
        certificates,
        selectedSpecialization!,
         contactInfoEmail.text,
        contactInfoPhone.text,
        contactInfoGitHub.text,
        contactInfoWebSite.text,
        about.text,
        selectedGender!);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
      
        myServices.box.write("step", "3");

        Get.offNamed(
          AppRoute.login,
        );
        getSnakBar("24".tr,  "${response["message"]}" , 3);

      } else {
         getDialog("203".tr, "${response["message"]}");        

      }
    }
    update();

    //  } else {}
  }

  initialData() {
    email = myServices.box.read("email");
    username = myServices.box.read("user_name");
  }

  List<Country> countries = <Country>[].obs;
  String? selectedCountry;
  List<City> cities = <City>[].obs;
  String? selectedCity;
  void Function(String?)? setSelectedCountry(type) {
    selectedCountry = type;

    cities = countries.firstWhere((element) => element.county == type).cities;
    selectedCity = null;
    update();
    return null;
  }

  void Function(String?)? setSelectedCiTy(type) {
    selectedCity = type;
    update();
    return null;
  }

  void loadJsonData() async {
    final String jsonString = await DefaultAssetBundle.of(Get.context!)
        .loadString('assets/models/countries.json');
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    final data = jsonData['data'] as List<dynamic>;
    update();
    countries = data.map((item) {
      final county = item['country'] as String;
      final cityNames = item['cities'] as List<dynamic>;
      final citiesList = cityNames.map((city) => City(name: city)).toList();
      return Country(county: county, cities: citiesList);
    }).toList();
    update();
  }

  @override
  void onInit() {
    initialData();
        loadJsonData();

    firstname = TextEditingController();
    lastname = TextEditingController();
     contactInfoEmail = TextEditingController();
    contactInfoPhone = TextEditingController();
    contactInfoGitHub = TextEditingController();
    contactInfoWebSite = TextEditingController();
    textEditingControllerskill = TextEditingController();
    textEditingControllerCertificates = TextEditingController();
    about = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();

    textEditingControllerCertificates.dispose();
    textEditingControllerskill.dispose();
 contactInfoEmail.dispose();
    contactInfoPhone.dispose();
    contactInfoGitHub.dispose();
    contactInfoWebSite.dispose();
    about.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    if (image != null) {
      image!.delete();
    }
    super.onClose();
  }
}
