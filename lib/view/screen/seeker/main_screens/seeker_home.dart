import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/drawer_controller.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';
import 'package:jobs/controller/company_seeker/news_controller.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/controller/saved_jobs/saved_opportunity_controller.dart';
import 'package:jobs/controller/seeker/post/create_post_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/data/model/news_model.dart';
import 'package:jobs/view/screen/company&seeker/drawer.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/app_bar_home.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/job_card_home.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/post_widget.dart';

class SeekerHome extends StatelessWidget {
  SeekerHome({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
      final newsController=  Get.put(NewsController());

    Get.put(GetPostsAndOpportunityControllerImp());
    Get.put(SavedController());

    final reportController = Get.put(ReportController());
    final controllerDrawer = Get.put(CustomDrawerController());
    final postController = Get.put(CreatePostControllerImp());
    final profileController = Get.put(GetUserController());
    return GetBuilder<GetPostsAndOpportunityControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.Backgroundcolor(),
              endDrawer: CustomDrawer(),
              key: _scaffoldKey,
              body: ListView(
                children: [
                  AppBarHome(
                    onPressedDrawer: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                      controllerDrawer.toggleDrawer();
                    },
                    onPressedSearch: () {
                      Get.toNamed(AppRoute.searchPage);
                    },
                    text: "43".tr,
                  ),
                 
                 
            newsController.newsList.isNotEmpty?
                  GetBuilder<NewsController>(
                    builder: (newsController) => Column(
                      children: [
                        TitleOpportunitiesHome(
                          title: "241".tr,
                          viewall: false,
                        ),
                        Container(
                            height: 160,
                            child: PageView.builder(
                                onPageChanged: (val) {
                                  newsController.onPageChanged(val);
                                },
                                controller: newsController.pageController,
                                itemCount: newsController.newsList.length,
                                clipBehavior: Clip.none,
                                itemBuilder: (context, index) {
                                  final newsItem =
                                      newsController.newsList[index];

                                  return CustomNewsCard(
                                    newsItem: newsItem,
                                    onTap: () {
                                      newsController.showNewsDialog(newsItem);
                                    },
                                  );
                                })),
                        CustomNewsDotes(),
                      ],
                    ),
                  )
                  
                  : Container(),
                  TitleOpportunitiesHome(
                    title: "45".tr,
                    onTapViewAll: () {
                      controller.goToPageAllOpportunities();
                    },
                    viewall: true,
                  ),
                  SizedBox(
                    height: 195,
                    child: HandlingDataView(
                        statusRequest: controller.statusRequestOpportunity,
                        widget: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.opportuntiesList.length,
                          itemBuilder: (context, index) {
                            return GetBuilder<SavedController>(
                                builder: (jobController) {
                              final isSaved = jobController.isSaved(
                                  controller.opportuntiesList[index].id!);

                              return JobCardHome(
                                opportuntiyModel:
                                    controller.opportuntiesList[index],
                                onPressed: () {
                                  controller.goToPageOpportunityDetails(
                                      controller.opportuntiesList[index]);
                                },
                                onTapGoToProfile: () {
                                  profileController.getUser(controller
                                      .opportuntiesList[index].user_id!);
                                },
                                icon: isSaved
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                onTapIcon: () async {
                                  await jobController
                                      .addOrRemoveToSavedOpportunity(controller
                                          .opportuntiesList[index].id!);
                                },
                              );
                            });
                          },
                        )),
                  ),
                  TitleOpportunitiesHome(
                    title: "46".tr,
                    onTapViewAll: () {
                      controller.goToPageAllPosts();
                    },
                    viewall: true,
                  ),
                  HandlingDataView(
                    statusRequest: controller.statusRequestPosts,
                    widget: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.postsList.length>10?8:controller.postsList.length,
                      itemBuilder: (context, i) {
                        return CustomPostWidget(
                            onTapGoToProfile: () {
                              profileController
                                  .getUser(controller.postsList[i].user_id!);
                            },
                            onPressedDownload: () async {
                              await controller.download(
                                  '${controller.postsList[i].files[0].url}',
                                  'file${controller.postsList[i].id}.pdf');
                            },
                            isLoudingPdf: controller.isLoading[controller
                                    .postsList[i].files.isNotEmpty
                                ? '${AppLink.serverimage}/${controller.postsList[i].files[0].url}'
                                : ' '],
                            postmodel: controller.postsList[i],
                            onTapExpanded: () async {
                              await controller
                                  .toggleExpanded(controller.postsList[i].id!);
                            },
                            isExpanded: controller
                                .isExpanded['${controller.postsList[i].id!}'],
                            textviewmore: controller.isExpanded[
                                    '${controller.postsList[i].id!}']
                                ? "235".tr
                                : "234".tr,
                            text: controller.isExpanded[
                                    '${controller.postsList[i].id!}']
                                ? controller.postsList[i].body!
                                : controller.postsList[i].body!.length > 20
                                    ? controller.postsList[i].body!
                                        .substring(0, 20)
                                    : controller.postsList[i].body!,
                            onSelected: (value) {
                              switch (value) {
                                case 'edit':
                                  postController
                                      .goToEditPage(controller.postsList[i]);
                                  break;
                                case 'delete':
                                  postController
                                      .deletePost(controller.postsList[i].id!);
                                  break;
                                case 'report':
                                  reportController.showReportSheetPost(
                                      controller.postsList[i].id!);
                                  break;
                              }
                            },
                            isOwner: controller.postsList[i].user_id ==
                                int.parse(controller.idUserPostOwner),
                            onTapImage: () {
                              controller
                                  .showPostDialog(controller.postsList[i]);
                            });
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}

class CustomNewsDotes extends StatelessWidget {
  const CustomNewsDotes({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<NewsController>(
        builder: (newsController) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              newsController.newsList.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 8),
                duration: const Duration(milliseconds: 900),
                width: newsController.currentPage == index ? 18 : 10,
                height: 10,
                decoration: BoxDecoration(
                    color: newsController.currentPage == index
                        ? AppColor.praimaryColor
                        : AppColor.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNewsCard extends StatelessWidget {
  const CustomNewsCard({
    super.key,
    required this.newsItem,
    this.onTap,
  });

  final NewsModel newsItem;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        color:AppColor.White(),
        margin: EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                    newsItem.title!.length >15?    "${newsItem.title!.substring(0,13)}.." : newsItem.title!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.TextColor()
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        newsItem.body!.length > 41
                            ? "${newsItem.body!.substring(0, 40)}....."
                            : newsItem.body!,
                        style: TextStyle(fontSize: 14,
                                                  color: AppColor.TextColor()

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (newsItem.images!.isNotEmpty)
              Expanded(
                flex: 2,
                child: PageView.builder(
                  itemCount: newsItem.images!.length,
                  itemBuilder: (context, imageIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 150,
                        child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),

                          child: Image.network(
                            "${AppLink.serverimage}/${newsItem.images![imageIndex].url!}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
