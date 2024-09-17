import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/home/home.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/view/widget/post/post_detail.dart';
import 'package:open_file/open_file.dart';

abstract class GetPostsAndOpportunityController extends GetxController
    with GetSingleTickerProviderStateMixin {
  getOpportunitesData();
  getPostsData();
  goToPageOpportunityDetails(OpportunityModel opportuntiyModel);
  scrollListener();
  goToPageAllOpportunities();
  goToPageAllPosts();
}

class GetPostsAndOpportunityControllerImp
    extends GetPostsAndOpportunityController {
  late ScrollController scrollController;
  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequestPosts = StatusRequest.none;
  late StatusRequest statusRequestOpportunity = StatusRequest.none;

  MyServices myServices = Get.find();
  var isFabVisible = true.obs;
  List dataopportuntiy = [];
  List<OpportunityModel> opportuntiesList = [];
  List dataposts = [];
  List<PostModel> postsList = [];

  late String idUserPostOwner;
  late String account;

  var isLoading = {}.obs;
  var isExpanded = {}.obs;
  late TabController tabController;

  Future download(String url, String fileName) async {
    String pdfurl = '${AppLink.serverimage}/$url';
    print(pdfurl);
    isLoading[pdfurl] = true;
    update();
    File file = await homeData.getFile(url, fileName);
    await Future.delayed(Duration(seconds: 2));
    isLoading[pdfurl] = false;
    update();
    await OpenFile.open(file.path);
  }

  int reason_id = 0;
  String another_reason = '';
  void editPost() {}
  void deletePost() {}
  @override
  getOpportunitesData() async {
    dataopportuntiy.clear();
    opportuntiesList.clear();
    statusRequestOpportunity = StatusRequest.loading;
    var response = await homeData.getAllOppData();
    print("================$response  Controller");
    statusRequestOpportunity = handlingData(response);
    if (StatusRequest.success == statusRequestOpportunity) {
      if (response['status'] == 200) {
        print("${dataopportuntiy.length}lllllllmmmmmmmmmmlllll");
        dataopportuntiy.addAll(response['data']);
        dataopportuntiy.isEmpty
            ? statusRequestOpportunity = StatusRequest.failure
            : statusRequestOpportunity = StatusRequest.none;
        print("lll ${dataopportuntiy.length}");
        for (int i = 0; i < dataopportuntiy.length; i++) {
          opportuntiesList.add(
            OpportunityModel.fromJson(dataopportuntiy[i]),
          );
        }
        update();
      } else {
        // statusRequest = StatusRequest.failure;
      }
    }
  }

  toggleExpanded(int id) async {
    isExpanded['$id'] = !isExpanded['$id'];
    update();
  }

  @override
  getPostsData() async {
    dataposts.clear();
    postsList.clear();
    statusRequestPosts = StatusRequest.loading;
    var response = await homeData.getAllPostsData();
    print("================$response  Controller");
    statusRequestPosts = handlingData(response);
    if (StatusRequest.success == statusRequestPosts) {
      if (response['status'] == 200) {
        print("${dataposts.length}lllllllllll");
        dataposts.addAll(response['data']);
        dataposts.isEmpty
            ? statusRequestPosts = StatusRequest.failure
            : statusRequestPosts = StatusRequest.none;
        print("llllllc ${dataposts.length}");
        for (int i = 0; i < dataposts.length; i++) {
          postsList.add(
            PostModel.fromJson(dataposts[i]),
          );
        }

        for (int i = 0; i < postsList.length; i++) {
          isExpanded['${postsList[i].id}'] = false;
          for (int j = 0; j < postsList[i].files.length; j++) {
            isLoading[postsList[i].files.isNotEmpty
                ? '${AppLink.serverimage}/${postsList[i].files[j].url}'
                : ''] = false;
          }
        }

        update();
      } else {}
    }
    update();
  }

  @override
  goToPageOpportunityDetails(opportuntiyModel) {
    Get.toNamed(AppRoute.opportunityPage,
        arguments: {"opportuntiyModel": opportuntiyModel});
  }

  @override
  goToPageAllOpportunities() {
    Get.toNamed(AppRoute.allOpportunityPage);
  }

  @override
  goToPageAllPosts() {
    Get.toNamed(AppRoute.allPostPage);
  }

  goToPageAddOpportunity() {
    Get.toNamed(AppRoute.addOpportunity);
  }

  goToPageAddPosts() {
    Get.toNamed(AppRoute.postpage);
  }

  int currentImage = 0;
  onPageImageChanged(int indexpage) {
    currentImage = indexpage;
    update();
  }

  @override
  void scrollListener() {
    final direction = scrollController.position.userScrollDirection;

    if (direction == ScrollDirection.reverse && isFabVisible.value) {
      isFabVisible.value = false;
      update();
    } else if (direction == ScrollDirection.forward && !isFabVisible.value) {
      isFabVisible.value = true;
      update();
    }
  }

  @override
  void onInit() async {
    super.onInit();

    getOpportunitesData();
    await getPostsData();
    account = myServices.box.read("account");
    idUserPostOwner = myServices.box.read("id");
    print("$idUserPostOwner idUserPostOwnerlllllllllllllllllllll");
    scrollController = ScrollController();
    tabController = TabController(length: 3, vsync: this);

    scrollController.addListener(scrollListener);
  }

  void showPostDialog(PostModel postmodel) {
    currentImage = 0;
    Get.dialog(PostDetailsDialog(
      content: postmodel.body!,
      filesUrl: postmodel.files,
      imageUrl: postmodel.images,
      title: "",
    ));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
