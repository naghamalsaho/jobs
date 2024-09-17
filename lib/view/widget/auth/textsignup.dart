import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(textone ,style:  TextStyle(
              color:AppColor.TextColor()),),
      const Text(' '),
      InkWell(
        onTap: onTap,
        child: Text(
          texttwo,
          style:  TextStyle(
              color:AppColor.PraimaryColor(), fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
