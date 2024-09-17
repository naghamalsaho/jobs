
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class DetailColumn extends StatelessWidget {
  final String name;
  final String description;
  const DetailColumn({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.TextColor())),
            ),
          ),
          Text(description,
              style: TextStyle(
                  color: AppColor.TextColor(), fontSize: 16, height: 1.5)),
        ],
      ),
    );
  }
}
