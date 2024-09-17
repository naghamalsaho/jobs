import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/google_sign_in_controller.dart';
import 'package:jobs/controller/auth/search_fire_controller.dart';
import 'package:jobs/core/constants/image_assest.dart';
import '../../../core/constants/color.dart';

class SearchChatAp extends GetView<SearchFireControllerImp> {
  final auth = Get.find<AuthWithGoogle>();
  SearchChatAp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchFireControllerImp());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          title: const Text('Search '),
          centerTitle: true,
          backgroundColor: AppColor.praimaryColor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onChanged: (val) {
                  controller.searchFriend(val, auth.userModel.value.email!);
                },
                controller: controller.search,
                cursorColor: AppColor.praimaryColor,
                decoration: InputDecoration(
                    fillColor: AppColor.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                             BorderSide(color: AppColor.white, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                             BorderSide(color: AppColor.white, width: 1)),
                    hintText: "Search new company or seeker here..",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    suffix: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child:  Icon(
                          Icons.search,
                          color: AppColor.praimaryColor,
                        ))),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.queryAwal.isEmpty
            ? Center(
                child: SizedBox(
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: const Text(" Nooo persons "),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.queryAwal.length,
                itemBuilder: (context, index) => Container(
                  height: Get.width / 4.5,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Color.fromARGB(255, 236, 232, 232),
                  ))),
                  child: ListTile(
                    onTap: () {
                      //  Get.to(() => ChatScreen());
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(AppImageAsset.onBoardingImgFour,
                          fit: BoxFit.fill),
                    ),
                    title: Text(
                      "name person  ${controller.queryAwal[index]["name"]}",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    subtitle: Text(
                      "name person  ${controller.queryAwal[index]["email"]}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        print(
                            "${controller.queryAwal[index]["email"]}mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
                        auth.addNewConnection(
                            controller.queryAwal[index]["email"]);
                      },
                      child: const Chip(
                        clipBehavior: Clip.none,
                        label: Text("send"),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
