import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/apply/get_apply_company_controller.dart';
import 'package:jobs/controller/apply/update_status_delete_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/view/widget/apply/apply_company_company.dart';
import 'package:lottie/lottie.dart';

class AllAppliesCompany extends StatelessWidget {
  AllAppliesCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetApplyCompanyControllerImp());
    final controller = Get.put(UpdateApplyControllerImp());
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Lottie.asset(AppImageAsset.personSearch,
                  width: 250, height: 250),
            ),
            GetBuilder<GetApplyCompanyControllerImp>(
                builder: (m) => HandlingDataView(
                    statusRequest: m.statusRequest,
                    widget: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: m.allAppliesCompany.length,
                      itemBuilder: (context, index) {
                        final application = m.allAppliesCompany[index];
        
                        return ApplyCompanyCard(
                            application: application,
                            isLoudingPdf: m.isLoading[
                                '${AppLink.serverimage}/${application.cvPath}'],
                            onPressedDownload: () async {
                              await m.download('${application.cvPath}',
                                  'apply_cv_${application.id}.pdf');
                            },
                            onPressedAccept: () {
                              controller.setSelectedStatus('accepted');
                              controller.updateStatusApply(application.id!);
                            },
                            onPressedReject: () {
                              controller.setSelectedStatus('rejected');
                              controller.updateStatusApply(application.id!);
                            });
                      },
                    ))),
          ],
        ),
      ),
    );
  }
}
