import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobs/view/screen/chat/chatcreen.dart';

class ChatsController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> chatStream(String email) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .collection("chats")
        .orderBy("lastTime", descending: true)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> friendStream(String email) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .snapshots();
  }

  void goToChatRoom(String chat_id, String email, String friendemail) async {
    CollectionReference chats = FirebaseFirestore.instance.collection("chats");
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    final updateStatusChat = await chats
        .doc(chat_id)
        .collection("chat")
        .where("isRead", isEqualTo: false)
        .where("penerima", isEqualTo: email)
        .get();

    updateStatusChat.docs.forEach((element) async {
      await chats
          .doc(chat_id)
          .collection("chat")
          .doc(element.id)
          .update({"isRead": true});
    });

    await users
        .doc(email)
        .collection("chats")
        .doc(chat_id)
        .update({"total_unread": 0});
    print(chat_id);
    Get.to( ChatScreen(),
       arguments: {"chat_id": chat_id, "friendEmail": friendemail});
  }
}
