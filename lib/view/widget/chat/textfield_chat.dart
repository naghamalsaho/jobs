import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

class TextFieldChatSend extends StatelessWidget {
  const TextFieldChatSend({super.key, this.onTap, required this.c});
  final void Function()? onTap;
  final TextEditingController c;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
                width: 200,
                height: Get.width / 7,
                child: TextField(
                  controller: c,
                  decoration: InputDecoration(
                    hintText: "enter your message",
                    hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.emoji_emotions_outlined)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                      ),
                    ),
                    focusColor: AppColor.praimaryColor,
                  ),
                )),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColor.praimaryColor,
            child: InkWell(
              onTap: onTap,
              child: Icon(
                Icons.send,
                color: AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
