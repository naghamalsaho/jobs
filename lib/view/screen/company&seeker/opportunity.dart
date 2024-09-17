import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/opportunity_details_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/view/widget/company&seeker/opportunity/detail_column.dart';
import 'package:jobs/view/widget/company&seeker/opportunity/item.dart';
import 'package:jobs/view/widget/company/add_opportunity/info_bottomsheet.dart';
import 'package:jobs/view/widget/company/add_opportunity/simple_list.dart';
import 'package:jobs/view/widget/general/custom_button.dart';
import 'package:jobs/view/widget/others_profile/icon_back.dart';

class OpportunityPage extends StatelessWidget {
  const OpportunityPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OpportunityDetailsControllerImp());
    return GetBuilder<OpportunityDetailsControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.Backgroundcolor(),
              bottomNavigationBar: controller.account != 'company'
                  ? SizedBox(
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            onPressed: () {
                              controller.chooseApplyWay(
                                  controller.opportuntiyModel.id!);
                            },
                            title: "96".tr,
                          ),
                          CustomButton(
                            onPressed: () {},
                            title: "97".tr,
                          ),
                        ],
                      ),
                    )
                  : null,
              body: ListView(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          // image: DecorationImage(
                          //     image: AssetImage(AppImageAsset.background3),
                          //     fit: BoxFit.cover),
                          color: AppColor.praimaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(30)),
                        ),
                      ),
                      Positioned(
                          top: 15,
                          right: 20,
                          left: 20,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconBack(
                                  onPressed: () {
                                    controller.back();
                                  },
                                ),
                                PopupMenuButton<String>(
                                  color: AppColor.White(),
                                  iconColor: AppColor.White(),
                                  onSelected: (value) {
                                    switch (value) {
                                      case 'edit':
                                        controller.goToEditPage(
                                            controller.opportuntiyModel);

                                        break;
                                      case 'delete':
                                        controller.deleteOpportunity(
                                            controller.opportuntiyModel.id!);
                                        break;
                                      case 'report':
                                        controller.report(
                                            controller.opportuntiyModel.id!);
                                        break;
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return controller.idUserOpportunityOwner ==
                                            controller.opportuntiyModel.user_id!
                                        ? <PopupMenuEntry<String>>[
                                            PopupMenuItem(
                                              value: 'edit',
                                              child: Text("66".tr,
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .TextColor())),
                                            ),
                                            PopupMenuItem(
                                              value: 'delete',
                                              child: Text("172".tr,
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .TextColor())),
                                            )
                                          ]
                                        : <PopupMenuEntry<String>>[
                                            PopupMenuItem(
                                              value: 'report',
                                              child: Text("100".tr,
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .TextColor())),
                                            ),
                                          ];
                                  },
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                        top: 78.0,
                        right: Get.width / 3.1,
                        left: Get.width / 3.1,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.Pink(),
                              border:
                                  Border.all(color: Colors.white, width: 5.0)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(200.0),
                              child: controller.opportuntiyModel.images != null
                                  ? Image.network(
                                      "${AppLink.serverimage}/${controller.opportuntiyModel.images}",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      AppImageAsset.onBoardingImgOne,
                                      fit: BoxFit.cover,
                                    )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(controller.opportuntiyModel.title!,
                        textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              
                              color: AppColor.PraimaryColor(),
                              letterSpacing: 1.2,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            )),
                        Text(
                            '${"148".tr}  ${controller.opportuntiyModel.location!}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColor.TextColor())),
                        const SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemDetailColumn(
                            icon: Icons.schedule,
                            info: "53".tr,
                            info2: controller.opportuntiyModel.jophours!,
                          ),
                          ItemDetailColumn(
                            icon: Icons.home_work,
                            info: "63".tr,
                            info2: controller.opportuntiyModel.workPlaceType!,
                          ),
                          ItemDetailColumn(
                            icon: Icons.work,
                            info: "61".tr,
                            info2: '${controller.opportuntiyModel.jopType}',
                          ),
                          ItemDetailColumn(
                            icon: Icons.home_work,
                            info: "55".tr,
                            info2: controller.opportuntiyModel.salary!,
                          ),
                        ],
                      )),
                  DetailColumn(
                    name: "51".tr,
                    description: " ${controller.opportuntiyModel.body!}",
                  ),
                  InfoRow(title: "59".tr, icon: Icons.lightbulb_outline),
                  CustomSimpleList(
                    list: controller.opportuntiyModel.skills!,
                  ),
                  InfoRow(title: "57".tr, icon: Icons.school),
                  CustomSimpleList(
                    list: controller.opportuntiyModel.qualifications!,
                  ),
                ],
              ),
            ));
  }
}
