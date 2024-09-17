import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jobs/controller/auth/google_sign_in_controller.dart';
import 'package:jobs/controller/chats/chat_room_controller.dart';
import 'package:jobs/view/widget/chat/appbar_chat_room.dart';
import 'package:jobs/view/widget/chat/bubble.dart';
import 'package:jobs/view/widget/chat/textfield_chat.dart';

class ChatScreen extends StatelessWidget {
  final auth = Get.put(AuthWithGoogle());
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatRoomController());

    return Scaffold(
      body: Column(
        children: [
          AppBarChatRoom(),
          Expanded(
              child: Container(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: controller.streamChats(controller.chatid),
              builder: (context, snapshot0) {
                print("${controller.chatid}mmmmmmmmmmmmmmmmm");
                if (snapshot0.connectionState == ConnectionState.active) {
                  var alldata = snapshot0.data!.docs;

                  Timer(
                    Duration.zero,
                    () => controller.scrollController.jumpTo(
                        controller.scrollController.position.maxScrollExtent),
                  );
                  return ListView.builder(
                      controller: controller.scrollController,
                      padding: EdgeInsets.zero,
                      itemCount: alldata.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text("${alldata[index]["groupTime"]}"),
                              Bubble(
                                isSender: alldata[index]["pengirim"] ==
                                        auth.userModel.value.email!
                                    ? true
                                    : false,
                                text: "${alldata[index]["msg"]}",
                                time: DateFormat.jm().format(DateTime.parse(
                                    "${alldata[index]["time"]}")),
                              ),
                            ],
                          );
                        } else {
                          if (alldata[index]["groupTime"] ==
                              alldata[index - 1]["groupTime"]) {
                            return Bubble(
                              isSender: alldata[index]["pengirim"] ==
                                      auth.userModel.value.email!
                                  ? true
                                  : false,
                              text: "${alldata[index]["msg"]}",
                              time: DateFormat.jm().format(
                                  DateTime.parse("${alldata[index]["time"]}")),
                            );
                          } else {
                            return Column(
                              children: [
                                Text("${alldata[index]["groupTime"]}"),
                                Bubble(
                                  isSender: alldata[index]["pengirim"] ==
                                          auth.userModel.value.email!
                                      ? true
                                      : false,
                                  text: "${alldata[index]["msg"]}",
                                  time: DateFormat.jm().format(DateTime.parse(
                                      "${alldata[index]["time"]}")),
                                ),
                              ],
                            );
                          }
                        }
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )),
          TextFieldChatSend(
            c: controller.chatC,
            onTap: () {
              print("${auth.userModel.value.email!}");
              print("${Get.arguments as Map<String, dynamic>}");
              print("${controller.chatC.text}");
              controller.newChat(auth.userModel.value.email!,
                  Get.arguments as Map<String, dynamic>, controller.chatC.text);
            },
          ),
        ],
      ),
    );
  }
}
