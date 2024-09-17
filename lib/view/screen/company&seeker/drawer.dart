import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/drawer_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/company&seeker/drawer_widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  final controller = Get.put(CustomDrawerController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: controller.isDrawerOpen.value
            ? MediaQuery.of(context).size.width * 0.55
            : 72,
        child: Drawer(
          child: Container(
            color: AppColor.Backgroundcolor(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 14),
                Expanded(
                  child: ListView(
                    children: [
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: controller.isDrawerOpen.value
                            ? InkWell(
                              onTap: () {
                                controller.goToProfile();
                              },
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: controller.image !=
                                            null
                                        ? NetworkImage(
                                            "${AppLink.serverimage}/${controller.image}")
                                        : null,
                                    radius: 46,
                                    child: controller.image != null
                                        ? null
                                        : Icon(Icons.account_circle,
                                            size: 85),
                                  ),
                                  Text('Welcome, ${controller.username}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.TextColor(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(height: 1.2),
                                  Text("${controller.email}",
                                      style: TextStyle(
                                        color: AppColor.TextColor(),
                                        fontSize: 14,
                                      )),
                                  Divider(
                                    color: AppColor.Grey(),
                                  ),
                                ],
                              ),
                            )
                            : SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child:
                                   

                                      CircleAvatar(
                                    backgroundImage: controller.image != null
                                        ? NetworkImage(
                                            "${AppLink.serverimage}/${controller.image}")
                                        : null,
                                    radius: 28,
                                    child: controller.image != null
                                        ? null
                                        : Icon(Icons.account_circle, size: 55),
                                  ),
                                ),
                              ),
                      ),
                      DrawerItem(
                        open: controller.isDrawerOpen.value,
                        icon: Icons.add,
                        itemName:
                            controller.account == 'company' ? "91".tr : "92".tr,
                        onTap: () {
                          controller.add();
                        },
                      ),
                      DrawerItem(
                        open: controller.isDrawerOpen.value,
                        icon: Icons.manage_accounts,
                        itemName: "85".tr,
                        onTap: () {
                          controller.profile();
                        },
                      ),
                      DrawerItem(
                        open: controller.isDrawerOpen.value,
                        icon: controller.dark == true?
                        Icons.wb_sunny_outlined:
                        Icons.dark_mode ,
                        itemName:
                        controller.dark == true?
                        "227".tr:
                       "86".tr,
                        onTap: () {
                          controller.toggleDarkMode();
                        },
                      ),
                      DrawerItem(
                          open: controller.isDrawerOpen.value,
                          icon: Icons.g_translate_outlined,
                          itemName: "87".tr,
                          onTap: () {
                            controller.setLang();
                          }),
                      DrawerItem(
                          open: controller.isDrawerOpen.value,
                          icon: Icons.assignment_turned_in,
                          itemName: "88".tr,
                          onTap: () {
                            controller.goToApplies();
                          }),
                      DrawerItem(
                        open: controller.isDrawerOpen.value,
                        icon: Icons.bookmark,
                        itemName: "89".tr,
                      ),
                      DrawerItem(
                        open: controller.isDrawerOpen.value,
                        icon: Icons.logout,
                        itemName: "90".tr,
                        onTap: () {
                          controller.logout();
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    icon: Icon(controller.isDrawerOpen.value
                        ? Icons.arrow_forward
                        : Icons.arrow_back
                        
                        ,
                        
                        color: AppColor.IconColor(),),
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                  ),
                ),
                SizedBox(
                  height: 74,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
