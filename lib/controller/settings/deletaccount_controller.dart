import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/dialiog_snack.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/settings/deletaccount.dart';

abstract class DeleteAccountController extends GetxController {
  deleteAccount();
}

class DeleteAccountControllerImp extends DeleteAccountController {
  StatusRequest statusRequest = StatusRequest.none;
  DeleteAccountData deleteAccountData = DeleteAccountData(Get.find());
  MyServices myServices = Get.find();

  @override
  deleteAccount() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteAccountData.deleteAccount();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        Get.offAllNamed(AppRoute.login);
        getSnakBar("24".tr, "${response["message"]}", 3);
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
    }
    update();
  }
}
