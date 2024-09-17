
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/apply/update_apply.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/auth/textsignup.dart';
import 'package:jobs/view/widget/general/custom_button_with_icon.dart';

class UpdateApplyCV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(UpdateCVApplyControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "228".tr,
          style: TextStyle(color: AppColor.white),
        ),
        iconTheme: IconThemeData(
          color: AppColor.white,
        ),
        backgroundColor: AppColor.PraimaryColor(),
      ),
      body: GetBuilder<UpdateCVApplyControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextTitle(
                        text: "189".tr,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextBody(text: "236".tr),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Image.asset(AppImageAsset.cv3,
                            width: 200, height: 200),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButtonWithIcon(
                        onPressed: () {
                          controller.pickFile();
                        },
                        icon: Icons.upload_file,
                        title: "191".tr,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      controller.selectedFilePath != null
                          ? Card(
                              child: ListTile(
                                leading: Icon(Icons.picture_as_pdf,
                                    size: 35, color: Colors.red),
                                title: Text(
                                  controller.selectedFilePath!.split('/').last,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text("119".tr),
                                onTap: () => controller.openSelectedFile(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 15),
                              ),
                            )
                          : Center(
                              child: Text(
                            "192".tr,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                     
                      CustomButtomAuth(
                          color: controller.selectedFilePath != null
                              ? AppColor.praimaryColor
                              : AppColor.grey,
                          text: "228".tr,
                          onPressed: () {
                            controller.selectedFilePath != null
                                ? controller.updateApplyCV()
                                : null;
                          }),
                           SizedBox(
                        height: 25,
                      ),
                     
                      CustomTextSignUpOrSignIn(
                          textone: "193".tr,
                          texttwo: "194".tr,
                          onTap: () {
                            controller.goToCreateCV();
                          }),
                      SizedBox(
                        height: 30,
                      ),
                     
                    ],
                  ),
                ),
              )),
    );
  }
}
