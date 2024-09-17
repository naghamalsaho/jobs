import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import '../../../data/model/apply_seeker_model.dart';

class JobApplySeekerCard extends StatelessWidget {
  final ApplySeekerModel applySeekerModel;
  final Function()? onTapIcon;
    final Function()? onTapEdit;

  JobApplySeekerCard({required this.applySeekerModel, required this.onTapIcon, this.onTapEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
      child: Card(
        color:AppColor.White(),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: AppColor.praimaryColor),
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: applySeekerModel.company_logo == null
                            ? Image.asset(AppImageAsset.onBoardingImgThree)
                            : Image.network(
                                "${AppLink.serverimage}/${applySeekerModel.company_logo}",
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Text( applySeekerModel.opportunity_name!.length>15?
                          "${applySeekerModel.opportunity_name!.substring(0,14)}...":applySeekerModel.opportunity_name!,
                          style:  TextStyle(
                              fontSize: 18,
                              
                              fontWeight: FontWeight.bold,
                              color: AppColor.PraimaryColor(),
                              height: 1.3),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          applySeekerModel.company_name!,
                          style:  TextStyle(
                              fontSize: 14, color: AppColor.Grey(), height: 1.5),
                        ),
                      ],
                    ),
                    Spacer(),
                    applySeekerModel.status! == 'waiting'
                        ? Row(
                          children: [
                             IconButton(
                              onPressed: onTapEdit,
                              icon: Icon(
                                Icons.edit,
                                color: AppColor.grey,
                                size: 26,)
                              ),
                            IconButton(
                              onPressed: onTapIcon,
                              icon: Icon(
                                Icons.delete,
                                color: AppColor.grey,
                                size: 26,)
                              ),
                              
                          ],
                        )
                        : Container(
                            child: Text(
                              "",
                              style: TextStyle(fontSize: 0),
                            ),
                          ),

                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "175".tr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.Grey(),
                    ),
                  ),
                  Text(
                    " ${applySeekerModel.status!}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _getStatusColor("${applySeekerModel.status!}"),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        '${applySeekerModel.createdat!}',
                        style: TextStyle(color: AppColor.TextColor()),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "waiting":
        return Colors.orange;
      case "accepted":
        return Colors.green;
      case "rejected":
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
