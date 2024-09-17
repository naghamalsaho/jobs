import 'dart:io';
import 'package:get/get.dart';
import 'package:jobs/controller/apply/get_apply_seeker_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/apply/apply_data.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';

abstract class ApplyController extends GetxController {
  apply(int id);
  updateApply(int id);
}

class ApplyControllerImp extends GetxController {
  AppliesData appliesData = AppliesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ImageAndFileData imageAndFileData = ImageAndFileData(Get.find());
  late int id;
  File? cv;
  String? selectedFilePath;

  void pickFile() async {
    selectedFilePath = await imageAndFileData.pickFileData();
    cv = File(selectedFilePath!);
    update();
  }

  void openSelectedFile() async {
    await imageAndFileData.openSelectedFile(cv!.path);
  }

  applyCV() async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await appliesData.applyCV(id, cv!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 201) {
        Get.lazyPut<GetApplySeekerControllerImp>;
        update();
        getSnakBar("24".tr, "${response["message"]}", 3);
        Get.offNamed(AppRoute.appliesSeeker);
      } else {
        if (response["status"] == 400) {
          getDialog("203".tr, "${response["message"]}");
        }
      }
      update();
    }
  }

  

  goToCreateCV() {
    Get.offAndToNamed(
      AppRoute.createCV,
    );
  }

  @override
  void onInit() {
    super.onInit();

    id = Get.arguments['id_opportunity'];
  }
}
