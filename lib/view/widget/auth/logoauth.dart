import 'package:flutter/material.dart';
import 'package:jobs/core/constants/image_assest.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo,
      height: 148,
    );
  }
}
