import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/seeker/post/edie_post.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/post/chosen_pdf_card.dart';
import 'package:jobs/view/widget/post/show_pdf_card.dart';

class EditPostPage extends StatelessWidget {
  EditPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditPostControllerImp());
    return GetBuilder<EditPostControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.Backgroundcolor(),
              appBar: AppBar(
                title: Text(
                  "121".tr,
                  style: TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.PraimaryColor(),
                iconTheme: IconThemeData(color: AppColor.White()),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      controller.editPost(controller.postmodel.id!);
                    },
                  ),
                ],
              ),
              body: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controller.bodyPost,
                            decoration: InputDecoration(
                              hintText: "118".tr,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                            itemCount: controller.oldFilespaths.length +
                                controller.newFiles!.length,
                            itemBuilder: (context, index) {
                              if (index < controller.oldFilespaths.length) {
                                return ShowPdfCard(
                                  onTapDownload: () async {
                                    await controller.download(
                                        '${controller.oldFilespaths[index].url}',
                                        '${controller.oldFilespaths[index].url!.split("/").last}');
                                  },
                                  pdfName: controller
                                      .oldFilespaths[index].url!
                                      .split('/')
                                      .last,
                                  onPressedDelete: () => {
                                    controller.removeOldFile(index,
                                        controller.oldFilespaths[index].id!)
                                  },
                                );
                              } else {
                                return ChosenPdfCard(
                                  pdfName: controller
                                      .newFiles![index -
                                          controller.oldFilespaths.length]
                                      .path
                                      .split('/')
                                      .last,
                                  onTapOpen: () =>
                                      controller.openSelectedFile(
                                        controller.selectedFiles[index -
                                          controller.oldFilespaths.length]),
                                  onPressedDelete: () =>
                                      {controller.removeNewFile(index -
                                    controller.oldFilespaths.length)},
                                );
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        GridView.builder(
                             physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.1,
                          ),
                          itemCount: controller.oldimagespaths.length +
                              controller.newImages!.length,
                          itemBuilder: (context, index) {
                            if (index < controller.oldimagespaths.length) {
                              return GestureDetector(
                                onTap: () {
                                  controller.removeOldImage(index,
                                      controller.oldimagespaths[index].id!);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                        "${AppLink.serverimage}/${controller.oldimagespaths[index].url}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  controller.removeNewImage(index -
                                      controller.oldimagespaths.length);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.file(
                                        File(controller
                                            .newImages![index -
                                                controller
                                                    .oldimagespaths.length]
                                            .path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.PraimaryColor(),
                focusColor: AppColor.White(),
                foregroundColor: AppColor.White(),
                onPressed: () {
                  controller.choose();
                },
                tooltip: "120".tr,
                child: const Icon(Icons.attach_file),
              ),
            ));
  }
}
