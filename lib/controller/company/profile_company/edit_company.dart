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
import 'package:jobs/data/datasource/remote/general/convert_image_to_file.dart';
import 'package:jobs/data/model/company.dart';

import '../../../data/model/country.dart';

abstract class UpdateProfileCompanyController extends GetxController {
  updateProfile();
  getImage();
}

class UpdateProfileCompanyControllerImp extends UpdateProfileCompanyController {
  late CompanyModel companyModel;
  late TextEditingController? namecompany;
  String? location;
  String? imagepathSave;
  File? image;
  late TextEditingController contactInfoEmail;
  late TextEditingController contactInfoPhone;
  late TextEditingController contactInfoGitHub;
  late TextEditingController contactInfoWebSite;
  late TextEditingController? about;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CompanyProfileData profileData = CompanyProfileData(Get.find());
  FileData fileData = FileData(Get.find());
  ImageAndFileData imageData = ImageAndFileData(Get.find());

  @override
  getImage() async {
    image = await imageData.getImageData();
    imagepathSave = null;
    update();
  }

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

  @override
  updateProfile() async {
    print(image == null && imagepathSave != null);
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111  Controller");
    var response = await profileData.updatePostdata(
        namecompany!.text,
        "$selectedCountry,$selectedCity",
        (image == null && imagepathSave != null) == true
            ? await fileData.downloadImage(imagepathSave!, 'img.jpg')
            : image != null
                ? image!
                : null,
        about!.text,
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
        getSnakBar("24".tr, "${response["message"]}", 3);
        myServices.box.write("image", response["data"]['more_info']['logo']);

        print(response["data"]['more_info']['logo']);
        print(myServices.box.read("image"));
        Get.offAllNamed(AppRoute.mainScreensCompany);
      }
    }
    update();

    //  } else {}
  }

  @override
  void onInit() {
    companyModel = Get.arguments['companyModel'];
    loadJsonData();
    selectedDomain = companyModel.domain;
    imagepathSave = companyModel.logo;
    namecompany = TextEditingController(text: companyModel.company_name);
    contactInfoEmail =
        TextEditingController(text: companyModel.contactInfoEmail);
    contactInfoPhone =
        TextEditingController(text: companyModel.contactInfoPhone);
    contactInfoGitHub =
        TextEditingController(text: companyModel.contactInfoGitHub);
    contactInfoWebSite =
        TextEditingController(text: companyModel.contactInfoeWebsite);

    about = TextEditingController(text: companyModel.about);
    location = companyModel.location;
    List<String> locationParts = location!.split(',');
    selectedCountry = locationParts[0];
    selectedCity = locationParts[1];
    super.onInit();
  }

  @override
  void dispose() {
    namecompany!.dispose();
    contactInfoEmail.dispose();
    contactInfoPhone.dispose();
    contactInfoGitHub.dispose();
    contactInfoWebSite.dispose();
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
