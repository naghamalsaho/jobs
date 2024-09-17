import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainScreenCompanyController extends GetxController {
  initialData();
}

class MainScreenCompanyControllerImp extends MainScreenCompanyController {
  late PageController pageController;
  GlobalKey bottomNavigationBar = GlobalKey();
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
      if (index == 0) {}
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
