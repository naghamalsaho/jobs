import 'package:flutter/material.dart';

class ShowPdfCard extends StatelessWidget {
  const ShowPdfCard({
    super.key,
    required this.onTapDownload,
    required this.pdfName,
    required this.onPressedDelete,
  });
  final Function() onTapDownload;
  final String pdfName;
  final void Function()? onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTapDownload,
        child: Card(
            elevation: 1,
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.picture_as_pdf, size: 35, color: Colors.red),
              title: Text(
                pdfName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              trailing: Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onPressedDelete,
                  )
                ],
              ),
            )));
  }
}
