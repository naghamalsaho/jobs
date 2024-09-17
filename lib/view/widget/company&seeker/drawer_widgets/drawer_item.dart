
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.open,
    required this.icon,
    required this.itemName,
    this.onTap,
  });
  final Function()? onTap;
  final bool open;
  final IconData icon;
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: open ? 0.0 : 3),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: ListTile(
            leading: Icon(
              icon,
              size: open ? 20 : 26,
              color: AppColor.IconColor(),
            ),
            onTap: onTap,
            //    selected: true,
            focusColor: AppColor.grey,
            title: open
                ? Text(
                    itemName,
                    style: TextStyle(fontSize: 15, color: AppColor.TextColor(),   fontFamily: "Gafata",),
                  )
                : null),
      ),
    );
  }
}
