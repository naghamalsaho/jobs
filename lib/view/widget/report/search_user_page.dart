import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/report/report_controller.dart';
import 'package:jobs/controller/search/search_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/report/custom_back.dart';
import 'package:jobs/view/widget/search/search_item.dart';

class ReportSearchUserPage extends StatelessWidget {
  const ReportSearchUserPage({
    super.key,
    required this.controller,
    required this.id,
    required this.onPressedSendPerprt,
    this.onTap,
  });

  final ReportController controller;
  final int id;
  final Function() onPressedSendPerprt;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(SearchControllerImp());
    final reportController = Get.put(ReportController());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColor.White(),
      ),
      height: 380,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomReportBack(onPressed: () {
                        controller.changePage(0);
                      }),
                      CustomTextTitle(
                        text: "100".tr,
                      ),
                      const SizedBox(width: 40)
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  endIndent: 10,
                  indent: 10,
                  color: AppColor.Grey(),
                ),
                CustomTextBody(
                                  text: "110".tr,
                                ),
                SizedBox(height: 15,),
                TextField(
                  controller: controller.who,
                  style: TextStyle(
                      color:AppColor.TextColor(),
                    ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "111".tr,
                    labelStyle: TextStyle(
                      color:AppColor.TextColor(),
                    ),
                  
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColor.TextColor()),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColor.TextColor()),
                    ),
                    iconColor: AppColor.IconColor(),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.Grey()),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      searchController.searchUser(value);
                    }
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 8),
                    child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          GetBuilder<SearchControllerImp>(
                              builder: (controller) {
                            var resultsList = searchController.data;
                            return HandlingDataRequest(
                              statusRequest: controller.statusRequest,
                              widget: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: resultsList.length,
                                itemBuilder: (context, index) {
                                  var user = resultsList[index]
                                      as Map<String, dynamic>;
                                  return SearchItem(
                                    image: user['type'] == 'company'
                                        ? user['more_info']['logo']
                                        : user['more_info']['image'],
                                    type: user['type'],
                                    user: user['user_name'],
                                    email: user['email'],
                                    onTap: () {
                                      reportController.who!.text =
                                          "${user['user_name']}";
                                    },
                                  );
                                },
                              ),
                            );
                          }),
                        ]),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomButtomAuth(
                    text: "106".tr,
                    onPressed: () async {
                      await onPressedSendPerprt();
                      controller.resetPage();

                      Get.back();
                    },
                color: AppColor.Grey().withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
