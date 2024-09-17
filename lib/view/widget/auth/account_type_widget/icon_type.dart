import 'package:flutter/material.dart';

class AccountTypeIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  AccountTypeIcon({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(4),
          child: Icon(
            icon,
            size: 70,
            color: color,
          ),
        ));
  }
}
