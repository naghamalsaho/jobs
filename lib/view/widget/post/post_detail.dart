import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/view/widget/company&seeker/news/pdf_card.dart';
import 'package:jobs/controller/company_seeker/news_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/data/model/post_model.dart';

class PostDetailsDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<ImageModel>? imageUrl;
  final List<ImageModel>? filesUrl;

  PostDetailsDialog({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.filesUrl,
  });

  @override
  Widget build(BuildContext context) {
   // final controller = Get.put(NewsController());
      final controller = Get.put(GetPostsAndOpportunityControllerImp());

    return Dialog(
        elevation: 2,
        backgroundColor: AppColor.Backgroundcolor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          height: Get.height * 0.58,
          width: Get.width * 0.5,
          child: DefaultTabController(
            length: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60,
                  child: TabBar(
                    labelColor: AppColor.TextColor(),
                    unselectedLabelColor: AppColor.Grey(),
                    controller: controller.tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          "238".tr,
                          style: TextStyle(color: AppColor.TextColor()),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "239".tr,
                          style: TextStyle(color: AppColor.TextColor()),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "240".tr,
                          style: TextStyle(color: AppColor.TextColor()),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Center(
                          child: ListView(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColor.TextColor(),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(content,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.TextColor(),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      )),
                      Center(
                        child: GetBuilder<NewsController>(
                            builder: (controller) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (imageUrl!.isNotEmpty)
                                      Container(
                                        height: Get.height * 0.3,
                                        child: PageView.builder(
                                          onPageChanged: (val) {
                                            controller.onPageImageChanged(val);
                                          },
                                          itemCount: imageUrl!.length,
                                          itemBuilder: (context, imageIndex) {
                                            return Image.network(
                                              width: Get.width * 0.35,
                                              height: Get.width * 0.35,
                                              "${AppLink.serverimage}/${imageUrl![imageIndex].url!}",
                                              fit: BoxFit.contain,
                                            );
                                          },
                                        ),
                                      ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...List.generate(
                                            imageUrl!.length,
                                            (index) => AnimatedContainer(
                                              margin: const EdgeInsets.only(
                                                  right: 8),
                                              duration: const Duration(
                                                  milliseconds: 900),
                                              width: controller.currentImage ==
                                                      index
                                                  ? 16
                                                  : 8,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .currentImage ==
                                                          index
                                                      ? AppColor.PraimaryColor()
                                                      : AppColor.Grey(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                      GetBuilder<GetPostsAndOpportunityControllerImp>(
                        builder: (postcontroller) => ListView.builder(
                          itemCount: filesUrl!.length,
                          itemBuilder: (context, index) {
                            return PdfCard(
                              isLoudingPdf: postcontroller.isLoading[filesUrl!
                                      .isNotEmpty
                                  ? '${AppLink.serverimage}/${filesUrl![index].url}'
                                  : ' '],
                              name: filesUrl![index].url!.split("/").last,
                              onPressed: () async {
                                await postcontroller.download(
                                    '${filesUrl![index].url!}',
                                    "file${filesUrl![index].id!}.${filesUrl![index].url!.split(".").last}");
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "197".tr,
                      style: TextStyle(color: AppColor.TextColor()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
