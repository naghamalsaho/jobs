import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar(
      {super.key,
      required this.search,
      required this.searchDescription,
      this.controller,
      this.onChange});
  final String search;
  final String searchDescription;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Stack(
      //  clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.height * 0.21,
          decoration: BoxDecoration(
            color: AppColor.praimaryColor,
            //  image: DecorationImage(
            //       image: AssetImage(AppImageAsset.background4),
            //       fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 5,
              ),
            ],
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),
        Positioned(
          top: 10,
          // right: 30,
          left: 20,
          child: Text(
            searchDescription,
            style: TextStyle(fontSize: 20, color: AppColor.White()),
          ),
        ),
        Positioned(
          top: -24,
          right: -30,
          // left: 20,
          child: Container(
            height: Get.height * 0.2,
            width: Get.height * 0.2,
            //clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: AppColor.praimaryColor.withOpacity(0.7),
              // image: DecorationImage(
              //     image: AssetImage(AppImageAsset.searchOnboarding),
              //     fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 5,
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(100),
                top: Radius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          top: Get.height * 0.157,
          right: 20,
          left: 20,
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.White(),
              borderRadius: BorderRadius.circular(19),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
                style: TextStyle(color: AppColor.TextColor()),
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: AppColor.IconColor(),),
                  hintText: search,
                  border: InputBorder.none,
                ),
                onChanged: onChange),
          ),
        ),
      ],
    );
  }
}
