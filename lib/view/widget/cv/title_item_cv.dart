import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/general/custom_button.dart';

class titleItemCv extends StatelessWidget {
  titleItemCv(
      {super.key,
      required this.itemName,
      required this.onPressed,
      required this.icon});
  final String itemName;
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB( 8,2,8,8 ),
            child: Text(itemName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.TextColor())),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                      color: AppColor.Grey2(),
                      height: 45,
                      width: 45,
                      child: Icon(icon, size: 24, color: AppColor.PraimaryColor()))),
             
               
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.White(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                  onPressed: onPressed,
                  child: Text(
                    " ${"185".tr} $itemName",
                    style: TextStyle(color: AppColor.TextColor()),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
