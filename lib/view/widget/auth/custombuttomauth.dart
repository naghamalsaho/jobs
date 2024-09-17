import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomButtomAuth extends StatelessWidget {
  final String  text;
  final void Function()? onPressed;
  final Color color ;
  const CustomButtomAuth({super.key, required this.text, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        onPressed: onPressed,
        color:color,
        textColor: AppColor.White(),
        child: Text(text),
      ),
    );
  }
}
