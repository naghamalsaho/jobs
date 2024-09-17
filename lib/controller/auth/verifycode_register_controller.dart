import 'dart:async';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeRegisterController extends GetxController {
  goToSuccessSignUp(String verifycode);
}

VerifyCodeRegisterData verifyCodeRegisterData =
    VerifyCodeRegisterData(Get.find());

class VerifyCodeRegisterControllerImp extends VerifyCodeRegisterController {
  String? email;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  @override
  goToSuccessSignUp(String verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");

    var response = await verifyCodeRegisterData.postdata(verifycode);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        myServices.box.write("token", "${response["data"]["token"]}");
        getSnakBar("24".tr, "${response["message"]}", 3);
          myServices.box.write("step", "2");

        Get.offNamed(AppRoute.successSignUp);
      } else if (response['status'] == 422) {
        print("244");
        getDialog("203".tr, "${response["message"]}");
      }
    }
    update();
  }

  Timer? timer;
  int remainingTime = 4;
  String get timerText =>
      '${(remainingTime ~/ 60).toString().padLeft(2, '0')}:${(remainingTime % 60).toString().padLeft(2, '0')}';

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (remainingTime > 0) {
        remainingTime--;
        update();
      } else {
        timer?.cancel();
      }
    });
  }

  void resendCode() {
    if (remainingTime == 0) {
      remainingTime = 4;
      startTimer();
      verifyCodeRegisterData.reSendCodeData(email!);
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];

    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
