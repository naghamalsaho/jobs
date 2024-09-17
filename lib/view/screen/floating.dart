import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';

class MyHomePagea extends StatelessWidget {
  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AAAA'),
      ),
      body: ListView.builder(
        controller: controller.scrollController,
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
      floatingActionButton: Obx(
        () => Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Visibility(
            visible: controller.isVisible.value,
            child: FloatingActionButton(
               backgroundColor: AppColor.PraimaryColor(),
                focusColor: AppColor.White(),
                foregroundColor: AppColor.White(),
              onPressed: () {
                Get.toNamed(AppRoute.onBoarding);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var isVisible = true.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isVisible.value = false;
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        isVisible.value = true;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
