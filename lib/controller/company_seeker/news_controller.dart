import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/view/widget/company&seeker/news/News_dialog.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/home/home.dart';
import 'package:jobs/data/model/news_model.dart';
import 'package:open_file/open_file.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  List datanews = [];
  List<NewsModel> newsList = [];

  late PageController pageController;
  int currentPage = 0;
  late Duration _duration;
  late Curve _curve;
  void startAutoScroll() {
    Future.delayed(_duration, () {
      if (pageController.page!.toInt() == newsList.length - 1) {
        pageController.jumpToPage(0);
      } else {
        pageController.nextPage(duration: _duration, curve: _curve);
        startAutoScroll();
      }
      update();
    });
  }

  onPageChanged(int indexpage) {
    currentPage = indexpage;
    update();
  }

  int currentImage = 0;
  onPageImageChanged(int indexpage) {
    currentImage = indexpage;
    update();
  }

  var isLoading = {}.obs;

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

  late TabController tabController;
  getNewsData() async {
    datanews.clear();
    newsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getNews();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${datanews.length}lllllllllll");
        datanews.addAll(response['data']);

        for (int i = 0; i < datanews.length; i++) {
          newsList.add(
            NewsModel.fromJson(datanews[i]),
          );
        }
    update();

        for (int i = 0; i < newsList.length; i++) {
          for (int j = 0; j < newsList[i].files!.length; j++) {
            isLoading[newsList[i].files!.isNotEmpty
                ? '${AppLink.serverimage}/${newsList[i].files![j].url}'
                : ''] = false;
          }
        }
      } else {}
    }
    update();
  }

  @override
  void dispose() {
    super.dispose();
    getNewsData();
    tabController.dispose();
    pageController.dispose();
  }

  @override
  void onInit() {
    getNewsData();

    pageController = PageController();
    tabController = TabController(length: 3, vsync: this);
    _duration = Duration(seconds: 3); 
    _curve = Curves.fastEaseInToSlowEaseOut;
    Future.delayed(Duration.zero, () {
     newsList.isNotEmpty? startAutoScroll():(){};
    });
    super.onInit();
  }

  void showNewsDialog(NewsModel news) {
    currentImage = 0;
    update();
    Get.dialog(NewsDetailsDialog(
        title: news.title!,
        content: news.body!,
        imageUrl: news.images!,
        filesUrl: news.files!));
  }
}
