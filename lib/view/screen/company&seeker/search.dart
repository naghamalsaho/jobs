import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';
import 'package:jobs/controller/search/search_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/search/app_bar_search.dart';
import 'package:jobs/view/widget/search/search_item.dart';

class SearchScreen extends StatelessWidget {
  final SearchControllerImp searchController = Get.put(SearchControllerImp());

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(GetUserController());

    return Scaffold(
      backgroundColor: AppColor.Backgroundcolor(),
      body: ListView(
                
        children: [
          SearchAppbar(
            search: "98".tr,
            searchDescription: "99".tr,
            controller: searchController.searchControllerText,
            onChange: (value) {
              if (value.isNotEmpty) {
                searchController.searchUser(value);
              }
            },
           ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GetBuilder<SearchControllerImp>(builder: (controller) {
                var resultsList = searchController.data;
                return HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: resultsList.length,
                    itemBuilder: (context, index) {
                      var user = resultsList[index] as Map<String, dynamic>;
                      return
                      SearchItem(
                        type: user['type'],
                        user: user['user_name'],
                        email: user['email'],
                       image:user['type'] =='company' ? user['more_info']['logo']:
                       
                       user['more_info']['image'],
                        onTap: () {
                          profileController.getUser(user['id']!);
                        },
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
