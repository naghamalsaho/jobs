import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/company/profile_company_data.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';
import '../../../data/model/country.dart';

abstract class CreateProfileCompanyController extends GetxController {
  createProfile();
  getImage();
}

class CreateProfileCompanyControllerImp extends CreateProfileCompanyController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  File? image;
  late TextEditingController companyname;
  late TextEditingController contactInfoEmail;
  late TextEditingController contactInfoPhone;
  late TextEditingController contactInfoGitHub;
  late TextEditingController contactInfoWebSite;

  late TextEditingController about;
  String? companyName;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  CompanyProfileData profileData = CompanyProfileData(Get.find());
  ImageAndFileData imageData = ImageAndFileData(Get.find());

  MyServices myServices = Get.find();

  String? selectedDomain;

  final List<String> domain = [
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

  void Function(String?)? setSelectedDomain(type) {
    selectedDomain = type;
    update();
    return null;
  }

  @override
  getImage() async {
    image = await imageData.getImageData();
    update();
  }

  @override
  createProfile() async {
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    var response = await profileData.createPostdata(
        companyname.text,
        "$selectedCountry,$selectedCity",
        image,
        about.text,
        contactInfoEmail.text,
        contactInfoPhone.text,
        contactInfoGitHub.text,
        contactInfoWebSite.text,
        selectedDomain!);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        myServices.box.write("step", "3");

        Get.offAllNamed(AppRoute.login);

        getSnakBar("24".tr, "${response["message"]}", 3);
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
    }
    update();

    //  } else {}
  }

  List<Country> countries = <Country>[].obs;
  String? selectedCountry;
  List<City> cities = <City>[].obs;
  String? selectedCity;
  String? searchValue;

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

  void Function(String?)? setSelectedSearch(type) {
    searchValue = type;
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
    loadJsonData();
    companyname = TextEditingController();
    contactInfoEmail = TextEditingController();
    contactInfoPhone = TextEditingController();
    contactInfoGitHub = TextEditingController();
    contactInfoWebSite = TextEditingController();

    about = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    companyname.dispose();
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
