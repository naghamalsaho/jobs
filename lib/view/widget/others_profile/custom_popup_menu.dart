import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu(
      {super.key,
      required this.isOwner,
      this.onPressedEdit,
      this.onPressedDelete,
      this.onPressedReport,
      this.onSelected});
  final bool isOwner;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  final void Function()? onPressedReport;
  final void Function(String)? onSelected;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColor.White(),
      iconColor: AppColor.White(),
      onSelected: (value) {
        switch (value) {
          case 'edit':
            () {
              onPressedEdit;
            };
            
            break;
          case 'delete':
            () {
              onPressedDelete;
            };
          
            break;
          case 'report':
            () {
              onPressedReport;
            };
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return isOwner
            ? <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: 'edit',
                  child: Text("Edit"),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text("Delete"),
                ),
              ]
            : <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: 'report',
                  child: Text("Report"),
                ),
              ];
      },
    );
  }
}
