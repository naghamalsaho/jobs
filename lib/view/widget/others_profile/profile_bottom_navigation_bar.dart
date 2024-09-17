import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/others_profile/follow/follow_button.dart';

class ProfileBottomNavigationBar extends StatelessWidget {
  const ProfileBottomNavigationBar({super.key, this.onPressed, required this.text});
 final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 54,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FavoriteWidget(
                      onPressed: onPressed,
                      text: text,
                    ),
                  ],
                ),
              );
  }
}