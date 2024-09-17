import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/seeker/proposed_Jobs_data.dart';
import 'package:jobs/data/datasource/remote/seeker/proposed_companies_data.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import 'package:jobs/data/model/proposed_company_model.dart';

import '../../core/constants/routes.dart';

abstract class GetProposedController extends GetxController {}

class GetProposedControllerImp extends GetProposedController {
  ProposedCompaniesData proposedCompaniesData =
      ProposedCompaniesData(Get.find());
  ProposedJobsData proposedJobsData = ProposedJobsData(Get.find());
  late StatusRequest statusRequestproposedJobs = StatusRequest.none;
  late StatusRequest statusRequestProposedCompanies = StatusRequest.none;

  MyServices myServices = Get.find();

  List dataProposedCompanies = [];
  List<ProposedCompanyModel> proposedCompaniesList = [];

  List dataProposedJobs = [];
  List<OpportunityModel> ProposedJobsList = [];

  getProposedCompanies() async {
    dataProposedCompanies.clear();
    proposedCompaniesList.clear();
    statusRequestProposedCompanies = StatusRequest.loading;
    var response = await proposedCompaniesData.getProposedCompaniesData();
    print("================$response  Controller");
    statusRequestProposedCompanies = handlingData(response);
    if (StatusRequest.success == statusRequestProposedCompanies) {
      if (response['status'] == 200) {
        dataProposedCompanies.addAll(response['data']);
        print("lll ${dataProposedCompanies.length}");
        for (int i = 0; i < dataProposedCompanies.length; i++) {
          proposedCompaniesList.add(
            ProposedCompanyModel.fromJson(dataProposedCompanies[i]),
          );
          if (proposedCompaniesList.isEmpty) {
            statusRequestProposedCompanies = StatusRequest.failure;
          }
          update();
        }
      } else {
        statusRequestProposedCompanies = StatusRequest.failure;
        getSnakBar("203".tr, "${response["message"]}", 3);
      }
    }
    update();
  }

  getProposedJobs() async {
    dataProposedJobs.clear();
    ProposedJobsList.clear();
    statusRequestproposedJobs = StatusRequest.loading;
    var response = await proposedJobsData.getProposedJobsData();
    print("================$response  Controller");
    statusRequestproposedJobs = handlingData(response);
    if (StatusRequest.success == statusRequestproposedJobs) {
      if (response['status'] == 200) {
        dataProposedJobs.addAll(response['data']);
        print("lll ${dataProposedJobs.length}");
        for (int i = 0; i < dataProposedJobs.length; i++) {
          ProposedJobsList.add(
            OpportunityModel.fromJson(dataProposedJobs[i]),
          );

        }
          if (ProposedJobsList.isEmpty) {
            statusRequestproposedJobs = StatusRequest.failure;
          }
          update();
      } else {
        statusRequestproposedJobs = StatusRequest.failure;
        getSnakBar("203".tr, "${response["message"]}", 3);
      }
    }
    update();
  }

  goToPageOpportunityDetails(opportuntiyModel) {
    Get.toNamed(AppRoute.opportunityPage,
        arguments: {"opportuntiyModel": opportuntiyModel});
  }

  @override
  void onInit() {
    getProposedCompanies();
    getProposedJobs();
    super.onInit();
  }
}
