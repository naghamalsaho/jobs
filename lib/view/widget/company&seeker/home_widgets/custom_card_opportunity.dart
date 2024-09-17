import 'package:flutter/material.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import 'package:get/get.dart';

class CardJob extends StatelessWidget {
  final OpportunityModel opportuntiyModel;
  final void Function()? onPressed;
  final void Function() onTapIcon;
  final IconData icon;
  final bool isCompany;
  const CardJob({
    super.key,
    required this.opportuntiyModel,
    this.onPressed,
    required this.onTapIcon,
    required this.icon,
    required this.isCompany,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.White(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: opportuntiyModel.companylogo != null
                          ? Image.network(
                              "${AppLink.serverimage}/${opportuntiyModel.companylogo}",
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppImageAsset.onBoardingImgOne,
                              fit: BoxFit.fill,
                            )),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: opportuntiyModel.id!,
                        child: Text(
                          opportuntiyModel.title!,
                          style:  TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.PraimaryColor(),
                              height: 1.1),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        opportuntiyModel.companyname!,
                        style:  TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.TextColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                    onTap: onTapIcon,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        color: AppColor.PraimaryColor(),
                        size: 28,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  icon:  Icon(Icons.info_outline,
                      color: AppColor.IconColor()),
                  label: Text("187".tr,
                      style: TextStyle(color: AppColor.PraimaryColor())),
                  onPressed: onPressed,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    opportuntiyModel.createdat!.substring(0,10),
                    style:  TextStyle(fontSize: 14, color: AppColor.TextColor()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
