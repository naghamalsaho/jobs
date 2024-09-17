import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';
import 'package:jobs/data/datasource/remote/general/convert_image_to_file.dart';
import 'package:jobs/data/datasource/remote/home/home.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/view/widget/general/custom_button_with_icon.dart';
import 'package:open_file/open_file.dart';

import '../../../data/datasource/remote/seeker/createpost_data.dart';

abstract class EditPostController extends GetxController {
  editPost(int id);
}

class EditPostControllerImp extends EditPostController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late PostModel postmodel;
  StatusRequest statusRequest = StatusRequest.none;
  PostData postData = PostData(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController bodyPost;

  HomeData homeData = HomeData(Get.find());
  FileData fileData = FileData(Get.find());

  // String? filePath;
  // ImageModel? file;
  // File? selectedFile;

  List<ImageModel> oldFilespaths = [];
  List<File>? newFiles = [];
  List<int>? idsFilesdelete = [];

  List<ImageModel> oldimagespaths = [];
  List<File>? newImages = [];
  ImageAndFileData imageAndFileData = ImageAndFileData(Get.find());
  List<int>? idsImagedelete = [];

  void removeOldImage(int image, int id) {
    oldimagespaths.removeAt(image);
    idsImagedelete!.add(id);
    print(idsImagedelete!);
    print(oldimagespaths);
    update();
  }

  void removeNewImage(int image) {
    newImages!.removeAt(image);
    print(newImages);
    update();
  }

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? image = await picker.pickMultiImage();
    if (image != null) {
      for (int i = 0; i < image.length; i++) {
        newImages!.add(File(image[i].path));
      }
      update();
    }
  }

  List<PlatformFile> selectedFiles = [];
  pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      selectedFiles = result.files;
      for (int i = 0; i < selectedFiles.length; i++) {
        newFiles!.add(File(selectedFiles[i].path!));
        print(newFiles);
      }
      update();
    }
  }

  void removeOldFile(int file, int id) {
    oldFilespaths.removeAt(file);
    idsFilesdelete!.add(id);
    print(idsFilesdelete!);
    print(oldFilespaths);
    update();
  }

  void removeNewFile(int file) {
    newFiles!.removeAt(file);
    print(newFiles);
    update();
  }

  editPost(int id) async {
    statusRequest = StatusRequest.loading;
    update();

    for (int i = 0; i < idsImagedelete!.length; i++) {
      await fileData.deleteImage(id, idsImagedelete![i]);
    }
    for (int i = 0; i < idsFilesdelete!.length; i++) {
      await fileData.deleteFile(id, idsFilesdelete![i]);
    }
    var response =
        await postData.editPostdata(id, bodyPost.text, newImages, newFiles);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      statusRequest = StatusRequest.loading;

      if (response["status"] == 200) {
        Get.offAllNamed(AppRoute.mainScreens);

        getSnakBar("24".tr, "${response["message"]}", 3);
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
    }
    update();
  }

  choose() {
    Get.defaultDialog(
        backgroundColor: AppColor.Backgroundcolor(),
        titleStyle: TextStyle(
          color: AppColor.TextColor(),
        ),
        title: "120".tr,
        content: Column(
          children: [
            SizedBox(height: 10),
            CustomButtonWithIcon(
              onPressed: () async {
                await pickFiles();

                Get.back();
                update();
              },
              icon: Icons.attach_file,
              title: "210".tr,
            ),
            SizedBox(height: 10),
            CustomButtonWithIcon(
              onPressed: () {
                pickImages();

                Get.back();
              },
              icon: Icons.add_a_photo,
              title: "209".tr,
            ),
          ],
        ));
  }

  Future download(String url, String fileName) async {
//String pdfurl = '${AppLink.serverimage}/$url';
    update();
    File file = await homeData.getFile(url, fileName);
    update();
    await OpenFile.open(file.path);
  }

  void openSelectedFile(selectedFile) async {
    await imageAndFileData.openSelectedFile(selectedFile!.path);
  }

  @override
  void onInit() async {
    postmodel = Get.arguments['postmodel'];
    bodyPost = TextEditingController(text: postmodel.body);
    oldFilespaths = postmodel.files;
    oldimagespaths = postmodel.images;
    print(":LLLLLLLLLLL");
  
    print(newImages);
    super.onInit();
  }

  @override
  void dispose() {
    bodyPost.dispose();
    super.dispose();
  }

  // @override
  // void onClose() {
  //   if (selectedFile != null) {
  //     selectedFile!.delete();
  //   }
  //   super.onClose();
  // }
}
