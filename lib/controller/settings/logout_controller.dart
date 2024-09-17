import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/dialiog_snack.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/settings/logoutdata.dart';

abstract class LogoutController extends GetxController {
  logout();
}

class LogoutControllerImp extends LogoutController {
  StatusRequest statusRequest = StatusRequest.none;
  LogoutData logoutData = LogoutData(Get.find());
  MyServices myServices = Get.find();

  @override
  logout() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await logoutData.logout();
    statusRequest = handlingData(response);
    print("Logout status: $statusRequest");

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        myServices.box.erase();
        
        Get.offAllNamed(AppRoute.login);
        getSnakBar("24".tr,  "${response["message"]}" , 3);
      } else {
  getDialog("203".tr, "${response["message"]}");        
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
