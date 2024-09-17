import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/model/company.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import '../../core/constants/routes.dart';

abstract class CompanyProfileController extends GetxController {}

class CompanyProfileControllerImp extends CompanyProfileController {
  MyServices myServices = Get.find();
  final reportController = Get.put(ReportController());
  StatusRequest statusRequest = StatusRequest.none;
  late CompanyModel companyModel;
  late List<OpportunityModel> opportunities;
  late int idUserOwner;

  initalData() {
    idUserOwner = int.parse(myServices.box.read("id"));
    companyModel = Get.arguments['companyModel'];
    opportunities = Get.arguments['opportunities'];
  }

  goToEditPage(OpportunityModel opportuntiyModel2) {
    Get.offNamed(AppRoute.editOpportunity,
        arguments: {"opportuntiyModel": opportuntiyModel2});
  }

  reportOpportunity(int id) {
    reportController.showReportSheetOpportunity(id);
  }

  reportUser(int id) {
    reportController.showReportSheetUser(id);
  }

  goToEditProfilePage(CompanyModel companyModel1) {
    Get.offNamed(AppRoute.editcompanyProfile,
        arguments: {"companyModel": companyModel1});
  }
   goToDeleteAccountPage( ) {
    Get.offNamed(AppRoute.deleteAccount);
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
