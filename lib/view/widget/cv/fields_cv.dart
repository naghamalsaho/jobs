import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

// ignore: must_be_immutable
class FieldsCV extends StatelessWidget {
  FieldsCV(
      {super.key, required this.list, required this.text, required this.fff});
  List<TextEditingController> list;
  List<FocusNode> fff;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                    color: AppColor.TextColor(), fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: text,
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: AppColor.Grey(),
                      ),
                      onPressed: () {
                        list.removeAt(i);
                        print(list);
                      }),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColor.praimaryColor,
                      )),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                autofocus: i == list.length - 1 ? true : false,
                focusNode: fff[i],
                onChanged: (val) {
                  list[i].text = val;
                },
                controller: list[i],
              ),
            );
          }),
    );
  }
}
