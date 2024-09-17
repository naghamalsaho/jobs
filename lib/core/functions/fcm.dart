//Notifications
import 'package:get/get.dart';
import 'package:jobs/controller/notifiication/notification_controller.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

fcm() {
     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
   

  FirebaseMessaging.onMessage.listen((message) {
    print("++++++++++++++++++++++++++++++++++++");
    //      print(message.notification);

    // print(message.notification!.title);
    // print(message.notification!.body);
        final n=    Get.put(NotificationControllerImp());
        n.getNotifications();

    getSnakBar(
      message.notification!.title!,
      message.notification!.body!,
      3
    );
  });
}

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);
}

   Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
     print('Handling a background message: ${message.messageId}');
//                 Get.find<NotificationControllerImp>().getNotifications();

   }
   
