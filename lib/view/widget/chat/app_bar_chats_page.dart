import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/view/screen/chat/search_chat.dart';

import '../../../core/constants/color.dart';

class AppBarChats extends StatelessWidget {
  const AppBarChats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: AppColor.praimaryColor,
      elevation: 5,
      shadowColor: AppColor.praimaryColor,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Chats',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: AppColor.white),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                    onTap: () {
                      Get.to(SearchChatAp());
                    },
                    child:  Icon(
                      Icons.search,
                      size: 35,
                    ))),
          ],
        ),
      ),
    );
  }
}
