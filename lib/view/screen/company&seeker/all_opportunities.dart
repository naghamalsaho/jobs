import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/controller/saved_jobs/saved_opportunity_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/custom_card_opportunity.dart';

class AllOpportunitiesPage extends StatelessWidget {
  AllOpportunitiesPage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(GetPostsAndOpportunityControllerImp);

    return GetBuilder<GetPostsAndOpportunityControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.Backgroundcolor(),
              key: scaffoldKey,
              appBar: AppBar(
                  backgroundColor: AppColor.praimaryColor,
                  iconTheme: IconThemeData(
                    color: AppColor.White(),
                  ),
                  title:
                      Text("45".tr, style: TextStyle(color: AppColor.white))),
              body: HandlingDataView(
                statusRequest: controller.statusRequestOpportunity,
                widget: Container(
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.opportuntiesList.length,
                    itemBuilder: (context, index) {
                      return GetBuilder<SavedController>(
                          builder: (jobController) {
                        final isSaved = jobController
                            .isSaved(controller.opportuntiesList[index].id!);
                        return CardJob(
                          isCompany: controller.account == 'company',
                          opportuntiyModel: controller.opportuntiesList[index],
                          onPressed: () =>
                              controller.goToPageOpportunityDetails(
                                  controller.opportuntiesList[index]),
                          icon:
                              isSaved ? Icons.bookmark : Icons.bookmark_border,
                          onTapIcon: () {
                            jobController.addOrRemoveToSavedOpportunity(
                                controller.opportuntiesList[index].id!);
                          },
                        );
                      });
                    },
                  ),
                ),
              ),
              floatingActionButton: controller.isFabVisible.value &&
                      controller.account == 'company'
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: FloatingActionButton(
                        backgroundColor: AppColor.PraimaryColor(),
                focusColor: AppColor.White(),
                foregroundColor: AppColor.White(),
                        tooltip: "91".tr,
                        onPressed: () {
                          controller.goToPageAddOpportunity();
                        },
                        child: Icon(Icons.add, color: AppColor.White()),
                      ),
                    )
                  : const SizedBox(),
            ));
  }
}
