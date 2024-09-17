import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/post/create_post_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/post/chosen_pdf_card.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreatePostControllerImp());
    return GetBuilder<CreatePostControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.Backgroundcolor(),
              appBar: AppBar(
                title: Text(
                  "117".tr,
                  style: TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.PraimaryColor(),
                iconTheme: IconThemeData(color: AppColor.white),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      controller.createPost();
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
                        controller.selectedFiles.isNotEmpty
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                itemCount: controller.selectedFiles.length,
                                itemBuilder: (context, index) {
                                  return ChosenPdfCard(
                                    pdfName:
                                        '${controller.selectedFiles[index].name}',
                                    onTapOpen: () =>
                                        controller.openSelectedFile(controller.selectedFiles[index]),
                                    onPressedDelete: () =>
                                        {controller.removeFiles(index)},
                                  );
                                })
                            : Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        SizedBox(
                          height: 20,
                        ),
                        controller.selectedImages.isNotEmpty
                            ? GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.1,
                              ),
                              itemCount: controller.selectedImages.length,
                              itemBuilder: (context, index) {
                                final image =
                                    controller.selectedImages[index];
                            
                                return GestureDetector(
                                  onTap: () {
                                    controller.removeImage(index);
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        child: Image.file(
                                          File(image.path),
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
                              },
                            )
                            : Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              )),
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
