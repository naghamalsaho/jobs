import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomSimpleList extends StatelessWidget {
  final List  list;
  const CustomSimpleList( {
    super.key, required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(), 
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Text('_  ${list[index]}', style: TextStyle(fontSize: 16, color: AppColor.TextColor()),);
        },
      ),
    );
  }
}
