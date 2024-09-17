import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/data/model/notification.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard(
      {super.key, required this.notification, this.onTap});
  final NotificationModel notification;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          
          color: notification.readAt != null
              ? AppColor.White()
              : AppColor.Pink().withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            notification.title,
                            style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.TextColor()),
                          ),
                          SizedBox(height: 4),
                          Text(notification.body, style: TextStyle( color: AppColor.TextColor())),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      color: Colors.yellow,
                      size: 42,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      formatDateTime(notification.createdAt),
                      style: TextStyle(color: AppColor.Grey(), fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

    String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return "186".tr;
    } else {
      return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    }
  }
}
