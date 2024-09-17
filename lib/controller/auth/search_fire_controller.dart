import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFireControllerImp extends GetxController {
  late TextEditingController search;
  var queryAwal = [].obs;
  var tempSearch = [].obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void searchFriend(String data, String email) async {
    print("search : $data");
    if (data.isEmpty) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      var capital = data.substring(0, 1).toUpperCase() + data.substring(1);
      print(capital);

      if (queryAwal.isEmpty && data.length == 1) {
        // CollectionReference clients =
        //     await firebaseFirestore.collection("clients");
        // final keyNameRes = await clients
        //     .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
        //     .where("email", isEqualTo: email)
        //     .get();

        CollectionReference users = await firebaseFirestore.collection("users");
        final keyNameRes = await users
            .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
            //.where("email", isEqualTo: email)
            .get();
        print("Total Data : ${keyNameRes.docs.length}");
        if (keyNameRes.docs.isNotEmpty) {
          for (int i = 0; i < keyNameRes.docs.length; i++) {
            queryAwal.add(keyNameRes.docs[i].data() as Map<String, dynamic>);
          }

          print("queryRes : $queryAwal");
        } else {
          print("data ");
        }
      }
      if (queryAwal.isNotEmpty) {
        tempSearch.value = [];
        for (var element in queryAwal) {
          if (element["name"].toString().startsWith(capital)) {
            print(element["name"].startsWith(capital));
            print(element["name"].toString().startsWith(capital));
            tempSearch.add(element);
            print("${tempSearch} tempppppppp");

            print(tempSearch.length);
          }
        }
      }
    }

    queryAwal.refresh();
    tempSearch.refresh();
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
