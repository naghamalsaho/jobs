import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/apply/apply_data.dart';
import 'package:jobs/data/model/apply_company_model.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';

abstract class GetApplyCompanyController extends GetxController {}

class GetApplyCompanyControllerImp extends GetApplyCompanyController {
  AppliesData appliesData = AppliesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List dataAllAppliesCompany = [];
  List<JobApplication> allAppliesCompany = [];

  var isLoading = {}.obs;

  Future download(String url, String fileName) async {
    String pdfurl = '${AppLink.serverimage}/$url';

    isLoading[pdfurl] = true;
    update();
    File file = await appliesData.getFile(url, fileName);
    await Future.delayed(Duration(seconds: 2));
    isLoading[pdfurl] = false;
    update();
    await OpenFile.open(file.path);
  }

  
  getAllAppliesCompany() async {
    allAppliesCompany.clear();
    dataAllAppliesCompany.clear();
    statusRequest = StatusRequest.loading;
    var response = await appliesData.getAllAppliesCompany();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        dataAllAppliesCompany.addAll(response['data']);
        // dataSaved.isEmpty
        //     ? statusRequest = StatusRequest.failure
        //     : statusRequest = StatusRequest.none;
        print("lll ${dataAllAppliesCompany.length}");
        for (int i = 0; i < dataAllAppliesCompany.length; i++) {
          allAppliesCompany.add(
            JobApplication.fromJson(dataAllAppliesCompany[i]),
          );
        }

        for (int i = 0; i < allAppliesCompany.length; i++) {
          isLoading[
                  '${AppLink.serverimage}/${allAppliesCompany[i].cvPath}'] =
              false;
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
        getSnakBar("203".tr, "${response["message"]}", 3);
      }
    }
  }

  @override
  void onInit() {
    getAllAppliesCompany();
    super.onInit();
  }
}
