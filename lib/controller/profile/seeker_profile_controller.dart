import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/data/model/seeker.dart';
abstract class SeekerProfileController extends GetxController {

}

class SeekerProfileControllerImp extends SeekerProfileController {
   MyServices myServices = Get.find();
  final reportController = Get.put(ReportController());
  StatusRequest statusRequest = StatusRequest.none;
  late SeekerModel seekerModel;
  late List<PostModel> posts;
  late int idUserOwner;

  initalData() {
    idUserOwner = int.parse(myServices.box.read("id"));
    seekerModel = Get.arguments['seekerModel'];
    posts = Get.arguments['posts'];
  }

  goToDeleteAccountPage( ) {
    Get.offNamed(AppRoute.deleteAccount);
  }


    goToEditPage(SeekerModel seekerModel1) {
    Get.offNamed(AppRoute.editProfile,
        arguments: {"seekerModel": seekerModel1});
  }

 reportUser(int id) {
    reportController.showReportSheetUser(id);
  }

  reportPost(int id) {
    reportController.showReportSheetPost(id);
  }

  void Back() {
    Get.back();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
