import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class PdfCard extends StatelessWidget {
  const PdfCard({
    super.key, required this.name, required this.isLoudingPdf, this.onPressed,
  });
  final String name;
  final bool isLoudingPdf;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: AppColor.White(),
      elevation: 2,
      shadowColor: AppColor.Black(),
      margin: EdgeInsets.all(4),
      
      child: ListTile(

        
        leading: Icon(Icons.picture_as_pdf, size: 35, color: Colors.red),
        title: Text(
          name,
          style: TextStyle(
            color: AppColor.TextColor(),
            fontWeight: FontWeight.bold,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        trailing: Stack(
          children: [
            IconButton(
              icon:  Icon(Icons.file_download,
              color: AppColor.Black(),
              ),
              onPressed: onPressed),
             isLoudingPdf
              ?
             Positioned.fill(
                child: CircularProgressIndicator(
                  color: AppColor.PraimaryColor(),
                  
                ))
            : Container(
                child: Text(
                  " ",
                  style: TextStyle(fontSize: 0),
             ),
            ),
          ],
        ),
      ),
    );
  }
}
