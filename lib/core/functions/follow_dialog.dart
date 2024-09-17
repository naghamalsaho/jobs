import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/data/model/follow_model.dart';
import 'package:jobs/view/widget/search/search_item.dart';
import '../constants/color.dart';

GetFollowDialog(List<FollowModel> list, String title, String isEmpty) async {
  return await Get.defaultDialog(
    contentPadding: EdgeInsets.zero,
    backgroundColor: AppColor.Backgroundcolor(),
    title: title,
    titlePadding:  EdgeInsets.all(20),
    titleStyle: TextStyle(color: AppColor.TextColor()),
    content: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
           
          ),
          height: list.length > 5 ? 500 : null,
          child: list.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  //  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    var follow = list[index];
                    return SearchItem(
                      image: follow.image,
                      type: follow.roles_name!,
                      user: follow.name!,
                      email: '',
                      onTap: () {
                        // profileController.getUser(following.id!);
                      },
                    );
                  },
                )
              : Center(
                  child:
                      Text(isEmpty, style: TextStyle(color: AppColor.TextColor()))),
        ),
         //CustomButton(onPressed:(){Get.back();} ,
        // title:"197".tr ,),
        
      ],
    ),

  );
}
