
import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class BackGroundProfileImage extends StatelessWidget {
  const BackGroundProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: AppColor.PraimaryColor(),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
    );
  }
}
