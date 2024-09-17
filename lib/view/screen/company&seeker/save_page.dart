import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/saved_jobs/saved_opportunity_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/custom_card_opportunity.dart';

class JobSavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<SavedController>();

    return Scaffold(
          backgroundColor: AppColor.Backgroundcolor(),
      appBar: AppBar(
        title: Text(
          "89".tr,
         style: TextStyle(color: AppColor.White()),
            ),
            iconTheme: IconThemeData(
              color: AppColor.White(),
            ),
            backgroundColor: AppColor.PraimaryColor(),
      ),
      body: GetBuilder<SavedController>(builder: (jobController) {
        return HandlingDataView(
            statusRequest: jobController.statusRequest,
            widget: ListView.builder(
              itemCount: jobController.opportuntiesList.length,
              itemBuilder: (context, index) {
                final isSaved = jobController
                    .isSaved(jobController.opportuntiesList[index].id!);
                return CardJob(
                  isCompany: jobController.account == 'company',
                  opportuntiyModel: jobController.opportuntiesList[index],
                  onPressed: () {
                    jobController.goToPageOpportunityDetails(
                        jobController.opportuntiesList[index]);
                  },
                  icon: isSaved ? Icons.bookmark : Icons.bookmark_border,
                  onTapIcon: () async {
                    await jobController.addOrRemoveToSavedOpportunity(
                        jobController.opportuntiesList[index].id!);
                  },
                );
              },
            ));
      }),
    );
  }
}
