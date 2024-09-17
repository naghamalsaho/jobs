import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/view/widget/company&seeker/news/pdf_card.dart';

class CustomPostWidget extends StatelessWidget {
  final PostModel postmodel;
  final void Function()? onTapExpanded;
  final bool isExpanded;
  final bool isOwner;
  final String text;
  final String textviewmore;
  final bool? isLoudingPdf;
  final void Function()? onPressedDownload;
  final Function()? onTapGoToProfile;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  final void Function()? onPressedReport;
  final void Function(String)? onSelected;
  final Function()? onTapImage;

  const CustomPostWidget({
    super.key,
    required this.postmodel,
    this.onTapExpanded,
    required this.isExpanded,
    required this.isOwner,
    required this.textviewmore,
    required this.text,
    this.isLoudingPdf,
    this.onPressedDownload,
    this.onTapGoToProfile,
    this.onPressedEdit,
    this.onPressedDelete,
    this.onPressedReport,
    required this.onSelected,
    this.onTapImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapImage,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: AppColor.White(), borderRadius: BorderRadius.circular(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: onTapGoToProfile,
                child: ListTile(
                  leading: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: AppColor.praimaryColor),
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: postmodel.profileImg == null
                          ? Image.asset(AppImageAsset.onBoardingImgThree)
                          : Image.network(
                              "${AppLink.serverimage}/${postmodel.profileImg}",
                              fit: BoxFit.cover),
                    ),
                  ),
                  title: Text(postmodel.createdby!,
                      style: TextStyle(
                          fontFamily: "Gafata",
                          height: 2,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.TextColor())),
                  subtitle: Text(postmodel.createdat!
                  
                  ,
                      style: TextStyle(
                          fontFamily: "Gafata",
                          height: 0.5,
                          fontSize: 14,
                          color: AppColor.TextColor())),
                  trailing: PopupMenuButton<String>(
                    iconColor: AppColor.Grey(),
                    color: AppColor.White(),
                    onSelected: onSelected,
                    itemBuilder: (BuildContext context) {
                      return isOwner
                          ? <PopupMenuEntry<String>>[
                              PopupMenuItem(
                                value: 'edit',
                                child: Text("121".tr,
                                    style:
                                        TextStyle(color: AppColor.TextColor())),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Text("208".tr,
                                    style:
                                        TextStyle(color: AppColor.TextColor())),
                              ),
                            ]
                          : <PopupMenuEntry<String>>[
                              PopupMenuItem(
                                value: 'report',
                                child: Text("100".tr,
                                    style:
                                        TextStyle(color: AppColor.TextColor())),
                              ),
                            ];
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppColor.TextColor(),
                          height: 1.45),
                      children: [
                        TextSpan(
                          text: text,
                        ),
                        TextSpan(
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.grey),
                          text: postmodel.body!.length > 20 ? textviewmore : '',
                          recognizer: TapGestureRecognizer()
                            ..onTap = onTapExpanded,
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
                child: postmodel.images.isNotEmpty
                    ? GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                        itemCount: postmodel.images.length > 2
                            ? 2
                            : postmodel.images.length,
                        itemBuilder: (context, index) {
                          final image = postmodel.images[index].url;

                          return Image.network(
                            height: 120,
                            "${AppLink.serverimage}/${image}",
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : postmodel.files.isNotEmpty
                        ? Container(
                            height: 100,
                            child: ListView.builder(
                                itemCount: postmodel.files.length > 1
                                    ? 1
                                    : postmodel.files.length,
                                itemBuilder: (context, index) {
                                  return PdfCard(
                                    isLoudingPdf:isLoudingPdf! ,
                                    name:   postmodel.files[index].url!
                                            .split('/')
                                            .last,
                                    onPressed:onPressedDownload ,
                                  );
                                  
                                }),
                          )
                        : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
