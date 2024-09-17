import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import '../../../controller/settings/deletaccount_controller.dart';

class DeleteAccountPage extends StatelessWidget {
  final DeleteAccountController controller =
      Get.put(DeleteAccountControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        backgroundColor: AppColor.PraimaryColor(),
        title: Text(
          "152".tr,
          style: TextStyle(color: AppColor.White()),
        ),
        iconTheme: IconThemeData(color: AppColor.White()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            CustomTextTitle(
              text: "152".tr,
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.warning,
              color: Colors.red,
              size: 85.0,
            ),
            SizedBox(height: 24),
            Text(
              "167".tr,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "168".tr,
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            ElevatedButton(
              child: Text("152".tr),
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.White(),
                backgroundColor: AppColor.PraimaryColor(),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("169".tr),
                      content: Text("170".tr),
                      actions: <Widget>[
                        TextButton(
                          child: Text("171".tr),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("172".tr),
                          onPressed: () {
                            controller.deleteAccount();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
