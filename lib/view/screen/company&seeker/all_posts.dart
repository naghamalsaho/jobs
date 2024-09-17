import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/controller/seeker/post/create_post_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/post_widget.dart';

class AllPostPage extends StatelessWidget {
  AllPostPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(GetPostsAndOpportunityControllerImp());
    final reportController = Get.put(ReportController());
    final profileController = Get.find<GetUserController>();
    final postController = Get.put(CreatePostControllerImp());

    return GetBuilder<GetPostsAndOpportunityControllerImp>(
      builder: (controller) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColor.Backgroundcolor(),
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: AppColor.white,
            ),
            backgroundColor: AppColor.praimaryColor,
            title: Text("46".tr, style: TextStyle(color: AppColor.white))),
        body: HandlingDataView(
            statusRequest: controller.statusRequestPosts,
            widget: ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.postsList.length,
              itemBuilder: (context, index) {
                return CustomPostWidget(
                  isExpanded: controller
                      .isExpanded['${controller.postsList[index].id!}'],
                  onTapGoToProfile: () {
                    profileController
                        .getUser(controller.postsList[index].user_id!);
                  },
                  onPressedDownload: () async {
                    await controller.download(
                        '${controller.postsList[index].files[0].url}',
                        'file${controller.postsList[index].id}.pdf');
                  },
                  isLoudingPdf: controller.isLoading[
                       controller.postsList[index].files.isNotEmpty? '${AppLink.serverimage}/${controller.postsList[index].files[0].url}': ' '
                     ],
                  postmodel: controller.postsList[index],
                  onTapExpanded: () async {
                    await controller
                        .toggleExpanded(controller.postsList[index].id!);
                  },
                  textviewmore: controller
                          .isExpanded['${controller.postsList[index].id!}']
                      ? "235".tr
                      : "234".tr,
                  text: controller
                          .isExpanded['${controller.postsList[index].id!}']
                      ? controller.postsList[index].body!
                      : controller.postsList[index].body!.length > 20
                          ? controller.postsList[index].body!.substring(0, 20)
                          : controller.postsList[index].body!,
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        postController
                            .goToEditPage(controller.postsList[index]);
                        break;
                      case 'delete':
                        postController
                            .deletePost(controller.postsList[index].id!);
                        break;
                      case 'report':
                        reportController.showReportSheetPost(
                            controller.postsList[index].id!);
                        break;
                    }
                  },
                  isOwner: controller.postsList[index].user_id ==
                      controller.idUserPostOwner,
                        onTapImage: () {
                              controller
                                  .showPostDialog(controller.postsList[index]);
                            }
                );
                
              },
            )),
        floatingActionButton:
            controller.isFabVisible.value && controller.account == 'job_seeker'
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FloatingActionButton(
                      backgroundColor: AppColor.PraimaryColor(),
                      focusColor: AppColor.White(),
                      foregroundColor: AppColor.White(),
                      tooltip: "92".tr,
                      onPressed: () {
                        controller.goToPageAddPosts();
                      },
                      child: Icon(Icons.add, color: AppColor.White()),
                    ),
                  )
                : const SizedBox(),
      ),
    );
  }
}
