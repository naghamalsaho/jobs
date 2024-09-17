import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/drawer_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/get_user.dart';
import 'package:jobs/data/model/company.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/data/model/seeker.dart';

class GetUserController extends GetxController {
  UserData userdata = UserData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List dataopportuntiesList = [];
  List datapostsList = [];
  List<OpportunityModel> opportuntiesList = [];
  List<PostModel> postsList = [];
  getUser(int id) async {
    dataopportuntiesList.clear();
    datapostsList.clear();

    opportuntiesList.clear();
    postsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await userdata.GetUserData(id);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print(
            "${response['data']['profile']['type']}gggggggggggggggggggggggggggg");
        if (response['data']['profile']['type'] == 'company') {
          dataopportuntiesList.addAll(response['data']['opportunity']);

          for (int i = 0; i < dataopportuntiesList.length; i++) {
            opportuntiesList.add(
              OpportunityModel.fromJson(dataopportuntiesList[i]),
            );
          }
          update();
          Get.toNamed(AppRoute.companyProfiles, arguments: {
            "companyModel": CompanyModel.fromJson(response['data']['profile']),
            "opportunities": opportuntiesList
          });
        } else {
          if (response['data']['profile']['type'] == 'job_seeker') {
            print("jjjjjjjjjjjjjjjjjjjobSeeker");
            datapostsList.addAll(response['data']['post']);
            for (int i = 0; i < datapostsList.length; i++) {
              postsList.add(
                PostModel.fromJson(datapostsList[i]),
              );
            }
            update();

            Get.toNamed(AppRoute.seekerProfiles, arguments: {
              "seekerModel": SeekerModel.fromJson(response['data']['profile']),
              "posts": postsList
            });

            update();
            print("jjjjjjjjjjjjjjjjjjjobSeeker");
          }
        }
      }
    } else {
      statusRequest = StatusRequest.failure;
      getSnakBar("203".tr, "${response["message"]}", 3);
    }

    update();
  }

  getUserOff(int id) async {
    dataopportuntiesList.clear();
    datapostsList.clear();

    opportuntiesList.clear();
    postsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await userdata.GetUserData(id);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print(
            "${response['data']['profile']['type']}gggggggggggggggggggggggggggg");
        if (response['data']['profile']['type'] == 'company') {
          dataopportuntiesList.addAll(response['data']['opportunity']);
          for (int i = 0; i < dataopportuntiesList.length; i++) {
            opportuntiesList.add(
              OpportunityModel.fromJson(dataopportuntiesList[i]),
            );
          }
          update();
          Get.offNamed(AppRoute.companyProfiles, arguments: {
            "companyModel": CompanyModel.fromJson(response['data']['profile']),
            "opportunities": opportuntiesList
          });
          Get.find<CustomDrawerController>().refresh();
        } else {
          if (response['data']['profile']['type'] == 'job_seeker') {
            print("jjjjjjjjjjjjjjjjjjjobSeeker");
            datapostsList.addAll(response['data']['post']);
            for (int i = 0; i < datapostsList.length; i++) {
              postsList.add(
                PostModel.fromJson(datapostsList[i]),
              );
            }
            update();

            Get.offNamed(AppRoute.seekerProfiles, arguments: {
              "seekerModel": SeekerModel.fromJson(response['data']['profile']),
              "posts": postsList
            });
            Get.find<CustomDrawerController>().refresh();

            update();
            print("jjjjjjjjjjjjjjjjjjjobSeeker");
          }
        }
      }
    } else {
      statusRequest = StatusRequest.failure;
      getSnakBar("203".tr, "${response["message"]}", 3);
    }

    update();
  }

  getUserInfo(int id) async {
    dataopportuntiesList.clear();
    datapostsList.clear();
    opportuntiesList.clear();
    postsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await userdata.GetUserData(id);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print(
            "${response['data']['profile']['type']}gggggggggggggggggggggggggggg");
        if (response['data']['profile']['type'] == 'company') {
          return CompanyModel.fromJson(response['data']['profile']);
        } else {
          if (response['data']['profile']['type'] == 'job_seeker') {
            return SeekerModel.fromJson(response['data']['profile']);
          }
        }
      }
    } else {
      statusRequest = StatusRequest.failure;
      getSnakBar("203".tr, "${response["message"]}", 3);
    }

    update();
  }

  goToPageOpportunityDetails(opportuntiyModel) {
    Get.toNamed(AppRoute.opportunityPage,
        arguments: {"opportuntiyModel": opportuntiyModel});
  }

  @override
  void onInit() {
    update();

    super.onInit();
  }
}
