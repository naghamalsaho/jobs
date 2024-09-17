import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/google_sign_in_controller.dart';
import 'package:jobs/controller/chats/chats_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/image_assest.dart';
import '../../widget/chat/app_bar_chats_page.dart';

class ChatsApp extends GetView<ChatsController> {
  final auth = Get.put(AuthWithGoogle());
   // final auth = Get.put(AuthWithGoogle());

  ChatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatsController());
    return Scaffold(
      body: Column(
        children: [
          AppBarChats(),
          Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: controller.chatStream(auth.userModel.value.email!),
            builder: (context, snapshot1) {
              if (snapshot1.connectionState == ConnectionState.active) {
                var ListDocsChats = snapshot1.data!.docs;
                print(ListDocsChats);
                return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: ListDocsChats.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder<
                          DocumentSnapshot<Map<String, dynamic>>>(
                        stream: controller
                            .friendStream(ListDocsChats[index]["connection"]),
                        builder: (context, snapshot2) {
                          if (snapshot2.connectionState ==
                              ConnectionState.active) {
                            var data = snapshot2.data!.data();
                            print(data);
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              onTap: () {
                                controller.goToChatRoom(
                                    "${ListDocsChats[index].id}",
                                    auth.userModel.value.email!,
                                    "${ListDocsChats[index]["connection"]}");
                              },
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Image.asset(
                                    AppImageAsset.onBoardingImgFour,
                                    fit: BoxFit.fill),
                              ),
                              title: Text(
                                "${data!["name"]}",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              subtitle: Text(
                                "${data["email"]}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: ListDocsChats[index]["total_unread"] ==
                                      0
                                  ? const SizedBox()
                                  : Chip(
                                      backgroundColor: AppColor.PraimaryColor(),
                                      clipBehavior: Clip.none,
                                      label: Text(
                                        "${ListDocsChats[index]["total_unread"]}",
                                        style: TextStyle(color: AppColor.White()),
                                      ),
                                    ),
                            );
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
        ],
      ),
    );
  }
}
