import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/data/model/apply_company_model.dart';

class ApplyCompanyCard extends StatelessWidget {
  const ApplyCompanyCard({
    super.key,
    required this.application,
    required this.isLoudingPdf,
    this.onPressedDownload,
    this.onPressedAccept,
    this.onPressedReject,
  });

  final JobApplication application;
  final bool isLoudingPdf;
  final void Function()? onPressedDownload;
  final void Function()? onPressedAccept;
  final void Function()? onPressedReject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3),
      child: Card(
        elevation: 5,
        color: AppColor.White(),
        child: Column(
          children: [
            ListTile(
              title:Text(
                " ${application.seeker_name}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:AppColor.TextColor()
                ),
              ), 
              subtitle: Text(' ${application.opportunity_name} ',
               style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:AppColor.Grey()
                ),),
              trailing: Column(
                children: [
                  Text(
                    " ${application.created_at!.substring(0, 11)}",
                    style: TextStyle(
                      fontSize: 14,
                      color:AppColor.Grey(),
                    ),
                  ),
                  Text(
                    " ${application.created_at!.substring(11)}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading:
                    Icon(Icons.picture_as_pdf, size: 35, color: Colors.red),
                title: Text(
                  application.cvPath!.split('/').last,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                trailing: Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.file_download),
                      onPressed: onPressedDownload,
                    ),
                    isLoudingPdf
                        ? Positioned.fill(child: CircularProgressIndicator())
                        : Container(
                            child: Text(
                              " ",
                              style: TextStyle(fontSize: 0),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            application.status == 'waiting'
                ? Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StatusButton(
                          color: AppColor.praimaryColor,
                          text: "173".tr,
                          onPressed: onPressedAccept,
                        ),
                        StatusButton(
                          color: Colors.grey,
                          text: "174".tr,
                          onPressed: onPressedReject,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                      
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                            bottom: Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "175".tr,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.grey,
                            ),
                          ),
                          Text(
                            " ${application.status!}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _getStatusColor("${application.status!}")
                                  .withOpacity(0.8),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  final Color color;
  final String text;
  final void Function()? onPressed;

  const StatusButton({
    super.key,
    required this.color,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
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
