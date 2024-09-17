import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';
import 'package:jobs/data/datasource/remote/general/convert_image_to_file.dart';
import 'package:jobs/data/datasource/remote/seeker/profile/profile_seeker.dart';
import 'package:jobs/data/model/seeker.dart';
import '../../../data/model/country.dart';

abstract class UpdateProfileController extends GetxController {
  updateProfile();
  getImage();
  pickBirthday(BuildContext context);
}

class UpdateProfileControllerImp extends UpdateProfileController {
  late SeekerModel seekerModel;
  late TextEditingController? firstname;
  late TextEditingController? lastname;
  late TextEditingController contactInfoEmail;
  late TextEditingController contactInfoPhone;
  late TextEditingController contactInfoGitHub;
  late TextEditingController contactInfoWebSite;
  String? location;
  String? birthday;
  File? image;
  List<String> skills = [];
  List<String> certificates = [];
  int selectedSkillIndex = -1;
  int selectedCertificatesIndex = -1;
  late TextEditingController? textEditingControllerskill;
  late TextEditingController? textEditingControllercertificates;
  late TextEditingController? about;
  String? selectedSpecialization;
  MyServices myServices = Get.find();
  String? imagepath;
  StatusRequest statusRequest = StatusRequest.none;
  ProfileData profileData = ProfileData(Get.find());
  FileData fileData = FileData(Get.find());
  ImageAndFileData imageData = ImageAndFileData(Get.find());
  GetUserController profilecontroller = GetUserController();
  //Specialization
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

//Gender
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

// Image
  getImage() async {
    image = await imageData.getImageData();
    imagepath = null;
    update();
  }

//Skill
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

//Certificates
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

//Location
  List<Country> countries = <Country>[].obs;
  String? selectedCountry;
  String? selectedCity;
  List<City> cities = <City>[].obs;
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

  File? getImageSaved() {
    if (imagepath != null) {
      return File(imagepath!);
    }
    return null;
  }

//birthday
  DateTime? birthday1;

  void pickBirthday(BuildContext context) async {
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
  updateProfile() async {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await profileData.updatePostdata(
        firstname!.text,
        lastname!.text,
        birthday1 == null ? birthday! : birthday1.toString(),
        "$selectedCountry , $selectedCity",
        image == null && imagepath != null
            ? await fileData.downloadImage(imagepath!,'img.jpg')
            : image != null
                ? image!
                : null,
        skills,
        certificates,
        selectedSpecialization!,
            contactInfoEmail.text,
        contactInfoPhone.text,
        contactInfoGitHub.text,
        contactInfoWebSite.text,
        about!.text,
        selectedGender!);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        getSnakBar("24".tr,  "${response["message"]}" , 3);

        myServices.box.write("image", response["data"]['more_info']['image']);
        print("${response["data"]['more_info']['image']}=============");
        print("${myServices.box.read("image")}111111111111");
        // profilecontroller.getUserOff(response["data"]['id']);
        Get.offAllNamed(AppRoute.mainScreens);
      }
    }
    update();
  }

  @override
  void onInit() {
    seekerModel = Get.arguments['seekerModel'];
    loadJsonData();
    textEditingControllercertificates = TextEditingController();
    textEditingControllerskill = TextEditingController();
    firstname = TextEditingController(text: seekerModel.first_name);
    lastname = TextEditingController(text: seekerModel.last_name);
    imagepath = seekerModel.image;
    location = seekerModel.location;
    List<String> locationParts = location!.split(',');
    // selectedCountry = locationParts[0].trim();
    // selectedCity = locationParts[1].trim();
    selectedCountry = locationParts[0];
    selectedCity = locationParts[1];
    birthday = seekerModel.birth_day;
    print(" $selectedCountry kkkkkkkkkk $selectedCity ");

    skills = seekerModel.skills!.map((i) => i.toString()).toList();
    certificates = seekerModel.certificates!.map((i) => i.toString()).toList();
    about = TextEditingController(text: seekerModel.about);
    selectedSpecialization = seekerModel.specialization;
    print(" $selectedSpecialization");
  contactInfoEmail =
        TextEditingController(text: seekerModel.contactInfoEmail);
    contactInfoPhone =
        TextEditingController(text: seekerModel.contactInfoPhone);
    contactInfoGitHub =
        TextEditingController(text: seekerModel.contactInfoGitHub);
    contactInfoWebSite =
        TextEditingController(text: seekerModel.contactInfoeWebsite);
    selectedGender = seekerModel.gender!;
    super.onInit();
  }

  @override
  void dispose() {
    firstname!.dispose();
    lastname!.dispose();
     contactInfoEmail.dispose();
    contactInfoPhone.dispose();
    contactInfoGitHub.dispose();
    contactInfoWebSite.dispose();
    textEditingControllerskill!.dispose();
    textEditingControllercertificates!.dispose();
    about!.dispose();
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
