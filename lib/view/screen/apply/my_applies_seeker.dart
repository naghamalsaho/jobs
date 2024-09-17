import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/apply/get_apply_seeker_controller.dart';
import 'package:jobs/controller/apply/update_status_delete_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/apply/apply_seeeker_card.dart';

class AppliesSeeker extends StatelessWidget {
  AppliesSeeker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(GetApplySeekerControllerImp());
    final deletController = Get.put(UpdateApplyControllerImp());
    return Scaffold(
      backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        title: Text(
          "196".tr,
          style: TextStyle(color: AppColor.White()),
        ),
        iconTheme: IconThemeData(
          color: AppColor.White(),
        ),
      ),
      body: GetBuilder<GetApplySeekerControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.myAppliesSeeker.length,
                itemBuilder: (context, index) {
                  final myApply = controller.myAppliesSeeker[index];
                  return JobApplySeekerCard(
                    applySeekerModel: myApply,
                    onTapIcon: () {
                      deletController.deleteApply(myApply.id!);
                    },
                    onTapEdit: () {
                      controller.goToUpdateApply(myApply.id!);
                    },
                  );
                })),
      ),
    );
  }
}
