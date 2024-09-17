import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/notifiication/notification_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/notification/notification_card.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());

    return GetBuilder<NotificationControllerImp>(builder: (controller) {
      return Scaffold(
          backgroundColor: AppColor.Backgroundcolor(),
          appBar: AppBar(
            backgroundColor: AppColor.PraimaryColor(),
            title: Text(
              "93".tr,
              style: TextStyle(color: AppColor.White()),
            ),
            iconTheme: IconThemeData(
              color: AppColor.White(),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.done_all),
                  tooltip: "94".tr,
                  onPressed: () {
                    controller.markNotificationAsRead();
                  }),
            ],
          ),
          body: HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.notifications.length,
              itemBuilder: (context, index) {
                final notification = controller.notifications[index];
                return CustomNotificationCard(
                  notification: notification,
                  onTap: () async {
                    print("${notification.id}");
                    await controller.getOpportunityDetails(notification.id);
                  },
                );
              },
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 58),
            child: FloatingActionButton(
              backgroundColor: AppColor.PraimaryColor(),
              focusColor: AppColor.White(),
              foregroundColor: AppColor.White(),
              tooltip: "95".tr,
              onPressed: () async {
                await controller.deleteAllNotifications();
              },
              child: Icon(Icons.delete, color: AppColor.White()),
            ),
          ));
    });
  }
}
