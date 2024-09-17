import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/data/model/user_chat_model.dart';
import 'package:jobs/view/screen/chat/chats.dart';
import '../../view/screen/chat/chatcreen.dart';

class AuthWithGoogle extends GetxController {
  var isSkipAuth = false.obs;
  var isAuth = false.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserCredential? userCredential;
  var userModel = UserModel().obs;
  Future<void> loginWithGoogle() async {
    try {
      await googleSignIn.signOut();
      await googleSignIn.signIn().then((value) => googleSignInAccount = value);
      final isSignin = await googleSignIn.isSignedIn();
      if (isSignin) {
        print(googleSignInAccount);
        print("yesss");
        final authgoogle = await googleSignInAccount!.authentication;
        print(authgoogle);
        final credential = await GoogleAuthProvider.credential(
            idToken: authgoogle.idToken, accessToken: authgoogle.accessToken);
        print(credential);
        await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => userCredential = value);

        // await FirebaseAuth.instance
        //     .signInWithCustomToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay1qeHc4MEBqb2JzYXBwLWVhNzJjLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwic3ViIjoiZmlyZWJhc2UtYWRtaW5zZGstanh3ODBAam9ic2FwcC1lYTcyYy5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tL2dvb2dsZS5pZGVudGl0eS5pZGVudGl0eXRvb2xraXQudjEuSWRlbnRpdHlUb29sa2l0IiwiaWF0IjoxNzIzODI3OTQxLCJleHAiOjE3MjM4MzE1NDEsInVpZCI6IjE1In0.Cw2LZOllSVU0sjQV2defA7Et2O1ObD38-XBshsx6LeL71M-gi9wbvd0CRDO8ulKhsHGLtqiytwK1OG5ASMWanp7obMPIfU62mtjU4VCqWcCGMpW0iwlZL4bznig-ZgAvpiHX7WxjduAYeVXvFtF9sVevy_QsRJx0JtjYlyM4WxU8qIzV4_lpn_ipG-K0bFBMSl1XnlFTdYcCHZXViFtetdeBr0__tkNOQWuif0mkQIcxxNEDlCwfw795Nm37hLDt1UznBMGb58DhYhait3YLLC5GMRfmeGJjZTnjB2X6fiHYrodPgLZ_phTbyyYoywpU57BAysLNhV3sYtkfxkyT3w")
        //     .then((value) => userCredential = value);
        CollectionReference users = await firebaseFirestore.collection("users");
        print(users);

        final checkuser = await users.doc(googleSignInAccount!.email).get();

        if (checkuser.data() == null) {
          await users.doc(googleSignInAccount!.email).set({
            "id": userCredential!.user!.uid,
            "name": googleSignInAccount!.displayName,
            "email": googleSignInAccount!.email,
            "keyName":
                googleSignInAccount!.displayName!.substring(0, 1).toUpperCase(),
            "status": "",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updateTime": DateTime.now().toIso8601String(),
          });

          await users.doc(googleSignInAccount!.email).collection("chats");
        } else {
          await users.doc(googleSignInAccount!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final curruser = await users.doc(googleSignInAccount!.email).get();
        final curruserdata = curruser.data() as Map<String, dynamic>;

        userModel(UserModel.fromJson(curruserdata));

        userModel.refresh();

        final listChats = await users
            .doc(googleSignInAccount!.email)
            .collection("chats")
            .get();

        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              totalunread: dataDocChat["total_unread"],
            ));
          });

          userModel.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          userModel.update((user) {
            user!.chats = [];
          });
        }

        userModel.refresh();

        isAuth.value = true;
        Get.to(ChatsApp());
        //Get.off(SearchChat());
      } else {}
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await googleSignIn.signOut();
    Get.offAllNamed(AppRoute.login);
  }

  void addNewConnection(String friendEmail) async {
    bool flagNewConnection = false;
    var chat_id;
    CollectionReference chats = firebaseFirestore.collection("chats");
    CollectionReference users = firebaseFirestore.collection("users");
    final docChats =
        await users.doc(googleSignInAccount!.email).collection("chats").get();
    if (docChats.docs.isNotEmpty) {
      final checkConnection = await users
          .doc(googleSignInAccount!.email)
          .collection("chats")
          .where("connection", isEqualTo: friendEmail)
          .get();
      if (checkConnection.docs.isNotEmpty) {
        flagNewConnection = false;
        // chat id from chat collection
        chat_id = checkConnection.docs[0].id;
      } else {
        flagNewConnection = true;
      }
    } else {
      flagNewConnection = true;
    }
    if (flagNewConnection) {
      final chatsDocs = await chats.where(
        "connections",
        whereIn: [
          [
            googleSignInAccount!.email,
            friendEmail,
          ],
          [
            friendEmail,
            googleSignInAccount!.email,
          ],
        ],
      ).get();
      if (chatsDocs.docs.isNotEmpty) {
        final chatDataId = chatsDocs.docs[0].id;
        final chatsData = chatsDocs.docs[0].data() as Map<String, dynamic>;
        await users
            .doc(googleSignInAccount!.email)
            .collection("chats")
            .doc(chatDataId)
            .set({
          "connection": friendEmail,
          "lastTime": chatsData["lastTime"],
          "total_unread": 0,
        });
        final listChats = await users
            .doc(googleSignInAccount!.email)
            .collection("chats")
            .get();
        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = <ChatUser>[];
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              totalunread: dataDocChat["total_unread"],
            ));
          });
          userModel.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          userModel.update((user) {
            user!.chats = [];
          });
        }
        chat_id = chatDataId;
        userModel.refresh();
      } else {
        final newchatDoc = await chats.add({
          "connections": [googleSignInAccount!.email, friendEmail],
        });

        await chats.doc(newchatDoc.id).collection("chat");

        await users
            .doc(googleSignInAccount!.email)
            .collection("chats")
            .doc(newchatDoc.id)
            .set({
          "connection": friendEmail,
          "lastTime": DateTime.now().toIso8601String(),
          "total_unread": 0,
        });
        final listChats = await users
            .doc(googleSignInAccount!.email)
            .collection("chats")
            .get();
        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = <ChatUser>[];
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            print(dataDocChatId);
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              totalunread: dataDocChat["total_unread"],
            ));
          });
          userModel.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          userModel.update((user) {
            user!.chats = [];
          });
        }
        chat_id = newchatDoc.id;
        userModel.refresh();
      }
    }
    print(chat_id);
    final updateStatusChat = await chats
        .doc(chat_id)
        .collection("chat")
        .where("isRead", isEqualTo: false)
        .where("penerima", isEqualTo: googleSignInAccount!.email)
        .get();

    updateStatusChat.docs.forEach((element) async {
      await chats
          .doc(chat_id)
          .collection("chat")
          .doc(element.id)
          .update({"isRead": true});
    });

    print("$chat_id nmnnnnnnnnnnnnnnn");
    await users
        .doc(googleSignInAccount!.email)
        .collection("chats")
        .doc(chat_id)
        .update({"total_unread": 0});
    Get.to(ChatScreen(),
        arguments: {"chat_id": "$chat_id", "friendEmail": friendEmail});
  }
}
