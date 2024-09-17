import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';

class ChosenPdfCard extends StatelessWidget {
  const ChosenPdfCard({
    super.key,
    required this.pdfName,
    this.onTapOpen,
    this.onPressedDelete,
  });
  final String pdfName;
  final Function()? onTapOpen;
  final void Function()? onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Icon(Icons.picture_as_pdf, size: 35, color: Colors.red),
        ),
        title: Text(
          pdfName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("119".tr),
        trailing: IconButton(
            icon:  Icon(Icons.delete, color:AppColor.Black()),
            onPressed: onPressedDelete),
        onTap: onTapOpen,
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      ),
    );
  }
}
