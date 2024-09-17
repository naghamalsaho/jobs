import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/company/add_opportunity/info_bottomsheet.dart';
import 'package:jobs/view/widget/company/add_opportunity/simple_list.dart';
import 'package:jobs/view/widget/general/custom_button.dart';

class BottomSheetOpportunity extends StatelessWidget {
  final File? image;
  final String title;
  final String body;
  final String location;
  final String jobType;
  final String workPlaceType;
  final String jobHours;
  final List qualifications;
  final List skills;
  final String salary;
  final String vacant;
  final void Function()? onPressedPublish;
  final void Function()? onPressedBack;

  const BottomSheetOpportunity({
    super.key,
    this.image,
    required this.title,
    required this.body,
    required this.location,
    required this.jobType,
    required this.workPlaceType,
    required this.jobHours,
    required this.qualifications,
    required this.skills,
    required this.salary,
    required this.vacant,
    this.onPressedPublish,
    this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: AppColor.White(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: CustomTextTitle(
                    text: "183".tr,
                  )),
                ),
                ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                  ),
                  subtitle: Text(
                    '  ${body.length > 20 ? '${body.substring(0, 20)}...' : body}',
                    style: const TextStyle(fontSize: 16, height: 1),
                  ),
                  trailing: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(120.0),
                        child: image != null
                            ? Image.file(
                                height: 70,
                                width: 70,
                                image!,
                                fit: BoxFit.cover,
                              )
                            : null),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 24,
                  color: AppColor.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoRow(
                      title: salary,
                      icon: Icons.attach_money_rounded,
                    ),
                    InfoRow(title: vacant, icon: Icons.event_seat),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoRow(
                      title: GetStringUtils(
                              workPlaceType.toString().replaceAll('_', ' '))
                          .capitalizeFirst!,
                      icon: Icons.home_work,
                    ),
                    InfoRow(
                      title: jobHours,
                      icon: Icons.schedule,
                    ),
                  ],
                ),
                InfoRow(
                  title: GetStringUtils(jobType.toString().replaceAll('_', ' '))
                      .capitalizeFirst!,
                  icon: Icons.work,
                ),
                InfoRow(title: "59".tr, icon: Icons.lightbulb_outline),
                CustomSimpleList(
                  list: skills,
                ),
                InfoRow(title: "180".tr, icon: Icons.school),
                CustomSimpleList(
                  list: qualifications,
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPressed: onPressedPublish,
                  title: "181".tr,
                ),
                CustomButton(
                  onPressed: onPressedBack,
                  title: "182".tr,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
