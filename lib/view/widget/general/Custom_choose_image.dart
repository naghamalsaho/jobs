import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomChooseImage extends StatelessWidget {
  final void Function()? onTap;
  final File? image;
  const CustomChooseImage({
    super.key,
    this.onTap,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColor.praimaryColor),
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(50)),
            child: ClipRRect(
              //radius: 50,
              //backgroundColor: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(50),
              child: image == null
                  ? const Icon(
                      Icons.photo_library,
                      color: Colors.deepPurple,
                      size: 50,
                    )
                  : Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
