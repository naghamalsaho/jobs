import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustomDate extends StatelessWidget {
  final String text;

  final void Function()? onTap;

  const CustomDate({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.Pink(),
              //border: Border.all(color: AppColor.grey, width: 1)
            ),
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(
                  flex: 1,
                ),
                 Icon(
                  Icons.date_range,
                color: AppColor.IconColor()),
              
                const Spacer(
                  flex: 1,
                ),
                Text(
                  text,
             style: TextStyle(color: AppColor.TextColor(), fontWeight: FontWeight.w600),
                ),
                const Spacer(flex: 10),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ));
  }
}
