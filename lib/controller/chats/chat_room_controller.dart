import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatRoomController extends GetxController {
  late String chatid;
  var isShowEmoji = false.obs;
  int totalunRead = 0;
  late FocusNode focusNode;
  late TextEditingController chatC;
  late ScrollController scrollController;
  Stream<QuerySnapshot<Map<String, dynamic>>> streamChats(String chat_id) {
    // CollectionReference chats = firebaseFirestore.collection("chats");
    print("$chat_id mj llllllllllllllllllll ");
    print(FirebaseFirestore.instance
        .collection("chats")
        .doc(chat_id)
        .collection("chat")
        .orderBy("time"));
    // return chats.doc("$chat_id").collection("chat").orderBy("time").snapshots();
    return FirebaseFirestore.instance
        .collection("chats")
        .doc(chat_id)
        .collection("chat")
        .orderBy("time")
        .snapshots();
  }

  void newChat(String email, Map<String, dynamic> argument, String chat) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    if (chat != "") {
      CollectionReference chats = firebaseFirestore.collection("chats");
      CollectionReference users = firebaseFirestore.collection("users");

      String date = DateTime.now().toIso8601String();
      final newChat =
          await chats.doc(argument["chat_id"]).collection("chat").add({
        //"sender"
        "pengirim": email,
        // "reciever" :
        "penerima": argument["friendEmail"],
        "msg": chat,
        "time": date,
        "isRead": false,
        "groupTime": DateFormat.yMMMd('en_US').format(DateTime.parse(date)),
      });
      Timer(
        Duration.zero,
        () =>
            scrollController.jumpTo(scrollController.position.maxScrollExtent),
      );
      chatC.clear();
      await users
          .doc(email)
          .collection("chats")
          .doc(argument["chat_id"])
          .update({
        "lastTime": date,
      });

      final checkChatFriend = await users
          .doc(argument["friendEmail"])
          .collection("chats")
          .doc(argument["chat_id"])
          .get();

      if (checkChatFriend.exists) {
        //friend ? exist in database
//first check totat UnRead
        final checkTotalUnRead = await chats
            .doc(argument["chat_id"])
            .collection("chat")
            .where("isRead", isEqualTo: false)
            .where("pengirim", isEqualTo: email)
            .get();
        //  totalunRead  friend
        totalunRead = checkTotalUnRead.docs.length;

        await users
            .doc(argument["friendEmail"])
            .collection("chats")
            .doc(argument["chat_id"])
            .update({"lastTime": date, "total_unread": totalunRead});
      } else {
        //friend not ? exist in database
        //new for friend database
        await users
            .doc(argument["friendEmail"])
            .collection("chats")
            .doc(argument["chat_id"])
            .set({"connection": email, "lastTime": date, "total_unread": 1});
      }
    }
  }

  @override
  void onInit() {
    chatid = (Get.arguments as Map<String, dynamic>)["chat_id"];
    chatC = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();
    // focusNode.addListener(() {
    //   if (focusNode.hasFocus) {
    //     isShowEmoji.value = false;
    //   }
    // });
    super.onInit();
  }

  @override
  void onClose() {
    chatC.dispose();
    //scrollController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
