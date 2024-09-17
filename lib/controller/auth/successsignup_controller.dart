import 'package:get/get.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/services/services.dart';

class SuccessSignUpConroller extends GetxController {
  late String account;
  MyServices myServices = Get.find();

  goToProfile() {
    account == 'company'
        ? Get.offAllNamed(AppRoute.createcompanyProfile)
        : Get.offAllNamed(AppRoute.createProfile);
  }

  @override
  void onInit() {
    account = myServices.box.read("account");
    super.onInit();
  }
}
