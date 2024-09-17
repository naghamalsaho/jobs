import 'package:flutter/material.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';

class customImage extends StatelessWidget {
  const customImage({
    super.key,
    required this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.PraimaryColor(),
          border: Border.all(color:AppColor.Backgroundcolor(), width: 4.0)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(150.0),
          child: image != null
              ? Image.network(
                  "${AppLink.serverimage}/${image}",
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  AppImageAsset.onBoardingImgOne,
                  fit: BoxFit.fill,
                )),
    );
  }
}
