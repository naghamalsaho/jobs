import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import '../../../../core/constants/image_assest.dart';

class JobCardHome extends StatelessWidget {
  final OpportunityModel opportuntiyModel;
  final void Function()? onPressed;
  final void Function()? onTapIcon;
  final void Function()? onTapGoToProfile;

  final IconData? icon;
  const JobCardHome({
    required this.opportuntiyModel,
    this.onPressed,
    super.key,
    this.icon,
    this.onTapIcon,
    this.onTapGoToProfile,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 195,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColor.Black().withOpacity(0.5),
                    spreadRadius: 0.15,
                    blurRadius: 1,
                  ),
                ],
                color: AppColor.White(),
                borderRadius: BorderRadius.circular(14)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColor.praimaryColor),
                            color: Colors.deepPurple.shade50,
                            borderRadius: BorderRadius.circular(50)),
                        child: Hero(
                          tag: opportuntiyModel.id!,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: opportuntiyModel.companylogo == null
                                ? Image.asset(AppImageAsset.onBoardingImgThree)
                                : Image.network(
                                    "${AppLink.serverimage}/${opportuntiyModel.companylogo}",
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: onTapGoToProfile,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                opportuntiyModel.title!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.PraimaryColor(),
                                  height: 1.3,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                opportuntiyModel.companyname!.length > 20
                                    ? "${opportuntiyModel.companyname!.substring(0, 19)}..."
                                    : opportuntiyModel.companyname!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColor.Grey(),
                                    height: 1.6),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: onTapIcon,
                          child: Icon(
                            icon,
                            color: AppColor.PraimaryColor(),
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ItemCardHomeWithIcon(
                    itemName: opportuntiyModel.salary!,
                    icon: Icons.attach_money_outlined,
                  ),
                  ItemCardHomeWithIcon(
                    itemName: opportuntiyModel.location!.length > 20
                        ? "${opportuntiyModel.location!.substring(0, 20)}..."
                        : opportuntiyModel.location!,
                    icon: Icons.location_on_outlined,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ItemDetailCardHome(
                          jobDetails: opportuntiyModel.jopType!,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ItemDetailCardHome(
                          jobDetails: opportuntiyModel.workPlaceType!,
                        ),
                        const Spacer(),
                        Text(opportuntiyModel.updatedat!,
                            style: TextStyle(
                                fontFamily: "Gafata",
                                height: 2,
                                fontSize: 14,
                                color: AppColor.TextColor())),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCardHomeWithIcon extends StatelessWidget {
  final String itemName;
  final IconData? icon;
  const ItemCardHomeWithIcon({
    super.key,
    required this.itemName,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColor.IconColor(),
          ),
          const SizedBox(width: 10),
          Text(itemName,
              style: TextStyle(
                  fontFamily: "Gafata",
                  height: 2,
                  fontSize: 14,
                  color: AppColor.TextColor())),
          const Spacer()
        ],
      ),
    );
  }
}

class ItemDetailCardHome extends StatelessWidget {
  final String jobDetails;
  const ItemDetailCardHome({
    super.key,
    required this.jobDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
          color: AppColor.Grey().withOpacity(0.65),
          borderRadius: BorderRadius.circular(8)),
      child: Text(jobDetails.toString().replaceAll('_', ' ').capitalizeFirst!,
          style: TextStyle(
              fontFamily: "Gafata",
              height: 2,
              fontSize: 14,
              color: AppColor.White())),
    );
  }
}

class TitleOpportunitiesHome extends StatelessWidget {
  final String title;
  final void Function()? onTapViewAll;
  final bool viewall;
  const TitleOpportunitiesHome({
    super.key,
    required this.title,
    this.onTapViewAll,
    required this.viewall,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.PraimaryColor(),
            ),
          ),
          InkWell(
              onTap: onTapViewAll,
              child: viewall
                  ? Text(
                      "140".tr,
                      style: TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        color: AppColor.Grey(),
                      ),
                    )
                  : Text("")),
        ],
      ),
    );
  }
}
