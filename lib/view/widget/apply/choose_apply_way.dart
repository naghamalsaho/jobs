import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/view/widget/general/custom_button_with_icon.dart';

class ApplicationWays extends StatelessWidget {
  ApplicationWays({Key? key, this.onPressedCV, })
      : super(key: key);
  final void Function()? onPressedCV;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonWithIcon(
            onPressed: onPressedCV,
            icon: Icons.upload_file,
            title: "176".tr,
          ),
          SizedBox(height: 20),
        
        ],
      ),
    );
  }
}
