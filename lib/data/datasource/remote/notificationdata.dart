import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';
import 'package:jobs/core/services/services.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  MyServices myServices = Get.find();

  fetchNotifications() async {
    final response = await crud.getData(AppLink.display);
    return response.fold((l) => l, (r) => r);
  }

  deleteAllNotifications() async {
    final response = await crud.deleteData(AppLink.deletenotification);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  markAsRead() async {
    final response = await crud.getData("${AppLink.makeRead}");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  fetchOpportunityDetails(
    //int objId, String title
    //
  String id) async {
    final response = await crud.postData(
      AppLink.getcontent,
      {
        "id" : id
        // 'obj_id': objId.toString(),
        // 'title': title,
      },
    );
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
