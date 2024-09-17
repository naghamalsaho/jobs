import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomTextFieldInfo extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final IconData? iconsuffix;
  final TextEditingController? mycontroller;
  final void Function()? onPressedsuffix;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String?)? valid;

  CustomTextFieldInfo(
      {required this.mycontroller,
      required this.label,
      required this.hint,
      this.icon,
      this.iconsuffix,
      this.maxLines,
      this.onPressedsuffix,
      this.keyboardType,
      this.onSubmitted,
      this.valid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextField(
        onSubmitted: onSubmitted,
        controller: mycontroller,
        keyboardType: keyboardType,
        style:
            TextStyle(color: AppColor.TextColor(), fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(
              color: AppColor.Grey(),
              fontSize: 14,
              fontWeight: FontWeight.w400),
              labelStyle:TextStyle(
              color: AppColor.TextColor(),
           ),
          prefixIcon: Icon(icon, color: AppColor.IconColor()),
          filled: true,
          fillColor: AppColor.Pink(),
          suffixIcon:
              IconButton(icon: Icon(iconsuffix,
              color: AppColor.IconColor(),
              ), onPressed: onPressedsuffix),
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
          // labelStyle: const TextStyle(color: AppColor.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        maxLines: maxLines,
        cursorOpacityAnimates: true,
      ),
    );
  }
}
