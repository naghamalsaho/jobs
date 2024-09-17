import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/contries.dart';

class Country {
  String? name;
  Country({this.name});
  factory Country.fromJson(Map<String, dynamic> json) =>
      Country(name: json['country']!);
}

class CountryController extends GetxController {
  List<Country> filteredCountries = <Country>[];
  String selectedCountry = '';

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  MyServices myServices = Get.find();
  CountriesData countriesData = CountriesData(Get.find());
  List data = [];
  var countriesList = <Country>[].obs;
  late StatusRequest statusRequest = StatusRequest.none;

  void fetchCountries() async {
    var response = await countriesData.getAllConData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['error'] == false) {
        print("${data.length}lllllllmmmmmmmmmmlllll");
        data.addAll(response['data']);
        print("lll ${data.length}");
        print("lll ${data}");
        for (int i = 0; i < data.length; i++) {
          countriesList.add(
            Country.fromJson(data[i]),
          );
        }
        update();
      } else {
        getSnakBar("203".tr, "${response["message"]}", 3);
      }
    }
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries = countriesList;
      update();
    } else {
      filteredCountries = countriesList.where((country) {
        return country.name!.toLowerCase().startsWith(query.toLowerCase());
      }).toList();
      update();
    }
  }
}
