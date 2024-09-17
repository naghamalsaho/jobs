import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';

abstract class MainScreenController extends GetxController {
  initialData();
}

class MainScreenControllerImp extends MainScreenController {
  late PageController pageController;
  GlobalKey bottomNavigationBar = GlobalKey();

  List data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  var currentindex = 0.obs;
  var page = RxInt(0);
  @override
  void onInit() {
    super.onInit();

    pageController = PageController();
  }

  void onItemClick(index) {
    if (index != page.value) {
      page(index);
      currentindex.value = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  @override
  void onClose() {
   // pageController.dispose();
    super.onClose();
  }

  @override
  initialData() {}
}
