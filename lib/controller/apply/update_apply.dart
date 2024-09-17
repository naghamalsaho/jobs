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

abstract class UpdateCVApplyController extends GetxController {
  updateApplyCV();
}

class UpdateCVApplyControllerImp extends UpdateCVApplyController {
  AppliesData appliesData = AppliesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ImageAndFileData imageAndFileData = ImageAndFileData(Get.find());
  late int apply_id;
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

  updateApplyCV() async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    print(apply_id);
        print(cv!);

    var response = await appliesData.updateApplyCV(apply_id, cv!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 201) {
        Get.lazyPut<GetApplySeekerControllerImp>;
        Get.offNamed(AppRoute.appliesSeeker);
        update();
        getSnakBar("24".tr, "${response["message"]}", 3);
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
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

    apply_id = Get.arguments['apply_id'];
  }
}
