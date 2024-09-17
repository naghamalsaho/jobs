
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class ItemDetailColumn extends StatelessWidget {
  final IconData icon;
  final String info;
  final String info2;
  const ItemDetailColumn({
    super.key,
    required this.icon,
    required this.info,
    required this.info2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.PraimaryColor(),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(icon, color: AppColor.White()),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(info,
              style:
                  TextStyle(fontSize: 12, height: 1, color: AppColor.Grey())),
          Text(
            info2,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColor.TextColor()),
          )
        ],
      ),
    );
  }
}
