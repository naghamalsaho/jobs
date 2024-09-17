import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class customShowFollowButton extends StatelessWidget {
  final String count;
  final void Function()? onPressed;
  final String text;

  const customShowFollowButton({
    super.key,
    required this.count,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 8.0),
        child: Column(
          children: [
            Text(count, style :TextStyle(
              color:AppColor.TextColor()
            )),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: AppColor.praimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(text, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
