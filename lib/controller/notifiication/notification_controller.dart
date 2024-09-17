import 'package:get/get.dart';
import 'package:jobs/controller/company/main_screens_company/main_screen_company_controller.dart';
import 'package:jobs/controller/seeker/mainscreen/main_scrren_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/notificationdata.dart';
import 'package:jobs/data/model/notification.dart';
import 'package:jobs/data/model/opportunity_model.dart';

abstract class NotificationController extends GetxController {
  Future<void> getNotifications();
  deleteAllNotifications();
  markNotificationAsRead();
  getOpportunityDetails(String id);
}

class NotificationControllerImp extends NotificationController {
  StatusRequest statusRequest = StatusRequest.none;
  NotificationData notificationData = NotificationData(Get.find());
  List datanotifications = [];
  List<NotificationModel> notifications = [];

  MyServices myServices = Get.find();
  late String account;

  @override
  getNotifications() async {
    datanotifications.clear();
    notifications.clear();
    statusRequest = StatusRequest.loading;
    var response = await notificationData.fetchNotifications();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${datanotifications.length}llllllllllll");
        datanotifications.addAll(response['data']);
        datanotifications.isEmpty
            ? statusRequest = StatusRequest.failure
            : statusRequest = StatusRequest.none;
        print("lll ${datanotifications.length}");
        for (int i = 0; i < datanotifications.length; i++) {
          notifications.add(
            NotificationModel.fromJson(datanotifications[i]),
          );
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
        getSnakBar("203".tr, "${response["message"]}", 3);
      }
    }
  }

  deleteAllNotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.deleteAllNotifications();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        Get.find<NotificationControllerImp>().getNotifications();
        update();

        getSnakBar("24".tr, "${response["message"]}", 3);
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
    }
    update();
  }

  markNotificationAsRead() async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await notificationData.markAsRead();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        getSnakBar("24".tr, "${response["message"]}", 3);
        Get.find<NotificationControllerImp>().getNotifications();
        update();
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
    }
    update();
  }

  getOpportunityDetails(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.fetchOpportunityDetails(id);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        if (response['data'] != null) {
          print(response['data']['type']);

          if (response['data']['type'] == 'application') {
            account == 'company'
                ? Get.toNamed(AppRoute.allAppliesCompany)
                : Get.toNamed(AppRoute.appliesSeeker);
          }
          if (response['data']['type'] == 'opportunity') {
            print("go  opportunity");

            Get.toNamed(AppRoute.opportunityPage, arguments: {
              'opportuntiyModel':
                  OpportunityModel.fromJson(response['data']['content'])
            });
          }
          if (response['data']['type'] == "post") {
        

            account == 'company'
                ? {Get.find<MainScreenCompanyControllerImp>().onItemClick(0)}
                : Get.find<MainScreenControllerImp>().onItemClick(0);
          }

          Get.find<NotificationControllerImp>().getNotifications();
        }
      }
      if (response['status'] == 404) {
        print(response['message']);
        getSnakBar("203".tr, response['message'], 3);
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    account = myServices.box.read("account");

    getNotifications();
  }
}
