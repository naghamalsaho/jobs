import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/controller/company_seeker/get_all_opportunity_posts_home.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/general/choose_image.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/view/widget/general/custom_button_with_icon.dart';
import '../../../data/datasource/remote/seeker/createpost_data.dart';

abstract class CreatePostController extends GetxController {
  createPost();
}

class CreatePostControllerImp extends CreatePostController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController bodyPost;
  StatusRequest statusRequest = StatusRequest.none;
  PostData postData = PostData(Get.find());
  MyServices myServices = Get.find();
  ImageAndFileData imageAndFileData = ImageAndFileData(Get.find());

  // File? selectedFile;
  // Future<void> pickFile() async {
  //   selectedFile = await File(await imageAndFileData.pickFileData());
  //   update();
  // }


 void removeFiles(int file) {
   
    selectedFiles.removeAt(file);
   files!.removeAt(file);
    print(images);
    update();
  }
  

  void openSelectedFile(selectedFile) async {
    await imageAndFileData.openSelectedFile(selectedFile!.path);
  }

  List<File>? images = [];
  var selectedImages = <XFile>[].obs;

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? image = await picker.pickMultiImage();

    if (image != null) {
      for (int i = 0; i < image.length; i++) {
        selectedImages.add(image[i]);
        images!.add(File(image[i].path));
        print(images);
      }
      update();
    }
  }

  List<File>? files = [];
 List<PlatformFile> selectedFiles = [];
  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
   allowedExtensions: ['pdf']);
    if (result != null) {
      selectedFiles = result.files;
      for (int i = 0; i < selectedFiles.length; i++) {
        //selectedImages.add(image[i]);
        files!.add(File(selectedFiles[i].path!));
        print(images);
      } 
      update(); 
    }
  }

  void removeImage(int image) {
   
    selectedImages.removeAt(image);
    images!.removeAt(image);
    print(images);
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
           
            CustomButtonWithIcon(
              onPressed: () {
                pickFiles();
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
                update();

                Get.back();
              },
              icon: Icons.add_a_photo,
              title: "209".tr,
            ),
          ],
        ));
  }

  goToEditPage(PostModel postmodel) {
    Get.toNamed(AppRoute.editpostpage, arguments: {'postmodel': postmodel});
  }

  @override
  createPost() async {
    //if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");
    print(files);
    var response =
        await postData.createPostdata(bodyPost.text, images, files);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        Get.lazyPut<GetPostsAndOpportunityControllerImp>;
        update();
        getSnakBar("24".tr, "${response["message"]}", 3);
        Get.offAllNamed(AppRoute.mainScreens);
      } else {
        Get.defaultDialog(
            title: "203".tr, middleText: "${response["message"]}");
      }
    }

    update();

  
  }

  deletePost(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    print("111111111111111111  Controller");
    var response = await postData.deletePost(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        Get.find<GetPostsAndOpportunityControllerImp>().getPostsData();
        update();
        getSnakBar("24".tr, "${response["message"]}", 3);
      } else {
        getDialog("203".tr, "${response["message"]}");
      }
    }
  }

  @override
  void onInit() {
    bodyPost = TextEditingController();
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
class MyController extends GetxController {
  List<PlatformFile> selectedFiles = [];

  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // هاد بيخلي المستخدم يختار أكثر من ملف
      type: FileType.any,  // هاد بيخلي المستخدم يختار أي نوع ملف
    );

    if (result != null) {
      selectedFiles = result.files; // هيك بنحطّ الملفات المختارة في قائمة 
      update(); // هيك بنبلغ GetX إنو لازم يعيد رسم واجهة المستخدم
    }
  }
}

class MyWidget extends StatelessWidget {
  final MyController controller = Get.put(MyController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اختيار الملفات"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: controller.pickFiles,
 
            child: Text("اختيار ملفات"),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.selectedFiles.length,
               
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.selectedFiles[index].name), // بنعرض اسم كل ملف
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
