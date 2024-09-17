import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/search/search_data.dart';

abstract class SearchController extends GetxController {
  searchUser(String username);
}

class SearchControllerImp extends SearchController {
  //List<Map<String, dynamic>> searchResults = [];
  List data = [];
  late TextEditingController searchControllerText;

  StatusRequest statusRequest = StatusRequest.none;
  SearchUserData searchUserData = SearchUserData(Get.find());

  @override
  searchUser(String username) async {
    data.clear();

    statusRequest = StatusRequest.loading;
    update();

    var response = await searchUserData.searchUser(username);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        print(response);
        data.clear();
        data.addAll(response['data']);
      } else {
        if (response["status"] == 404) {
          statusRequest = StatusRequest.failure;

        getSnakBar("203".tr, "${response["message"]}", 3);
        } else {
          statusRequest = StatusRequest.failure;
        getSnakBar("203".tr, "${response["message"]}", 3);
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    searchControllerText = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchControllerText.dispose();
    super.dispose();
  }
}
