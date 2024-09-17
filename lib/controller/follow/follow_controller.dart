import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/dialiog_snack.dart';
import 'package:jobs/core/functions/follow_dialog.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/follow/follow_data.dart';
import 'package:jobs/data/model/follow_model.dart';

abstract class FollowController extends GetxController {}

class FollowControllerImp extends FollowController {
  final int idUser;
  FollowControllerImp({required this.idUser});
  StatusRequest statusRequest = StatusRequest.none;
  FollowData followData = FollowData(Get.find());
  MyServices myServices = Get.find();

  List datafollowersList = [];
  List datafollowingsList = [];
  List<FollowModel> followersList = [];
  List<FollowModel> followingsList = [];
  List<int> myFollowings = [];
  late int myid;
  List dataMyfollowingsList = [];
  List<FollowModel> myFollowingsList = [];

  int followersCount = 0;
  int followingsCount = 0;

  final profileController = Get.put(GetUserController());

  getFollowers() async {
    datafollowersList.clear();
    followersList.clear();
    statusRequest = StatusRequest.loading;
    var response = await followData.getFollowers(idUser);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        followersCount = response['data']['count'];
        update();
        datafollowersList.addAll(response['data']['followers']);
        print("lll ${datafollowersList.length}");
        update();
        for (int i = 0; i < datafollowersList.length; i++) {
          followersList.add(
            FollowModel.fromJson(datafollowersList[i]),
          );
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
        getSnakBar("203".tr, "${response["message"]}", 3);
      }
    }
    update();
  }

  getFollowings() async {
    datafollowingsList.clear();
    followingsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await followData.getFollowings(idUser);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        followingsCount = response['data']['count'];
        update();

        datafollowingsList.addAll(response['data']['followings']);
        print("lll ${datafollowingsList.length}");
        update();
        for (int i = 0; i < datafollowingsList.length; i++) {
          followingsList.add(
            FollowModel.fromJson(datafollowingsList[i]),
          );
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
        getSnakBar("203".tr, "${response["message"]}", 3);
      }
    }
    update();
  }

  FollowOrRemove(int id) async {
    final isCurrentlySaved = myFollowings.contains(id);
    if (isCurrentlySaved) {
      myFollowings.remove(id);
    } else {
      myFollowings.add(id);
    }
    update();
    print(id);
    print("$id  idddddddd");

    var response = await followData.toggleFollowUser(id);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] != 200) {
        if (isCurrentlySaved) {
          myFollowings.add(id);
        } else {
          myFollowings.remove(id);
        }
        getSnakBar("203".tr, "${response["message"]}", 3);
        update();
      } else {
        var update1 = Get.find<FollowControllerImp>();
        update1.getFollowers();
        update();
        getSnakBar("24".tr, response['message'], 3);
      }
    }
  }

  getMyFollowings() async {
    myFollowings.clear();
    dataMyfollowingsList.clear();
    myFollowingsList.clear();
    statusRequest = StatusRequest.loading;
    var response = await followData.getFollowings(myid);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        dataMyfollowingsList.addAll(response['data']['followings']);
        print("${dataMyfollowingsList.length}llllllllllll");
        update();
        for (int i = 0; i < dataMyfollowingsList.length; i++) {
          myFollowingsList.add(
            FollowModel.fromJson(dataMyfollowingsList[i]),
          );
          print("llhhl ${dataMyfollowingsList.length}");
          myFollowings.add(dataMyfollowingsList[i]['id']);
          print("llkkkkkkkkkl ${dataMyfollowingsList.length}");
          print("lllmy folloming $myFollowings");
          update();
        }

        update();
      } else {
        statusRequest = StatusRequest.failure;
        getSnakBar("203".tr, "${response["message"]}", 3);
      }
    }
  }

  bool isFollow() {
    if (myFollowings.contains(idUser)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    myid = int.parse(myServices.box.read("id"));
    getFollowers();
    getFollowings();
    getMyFollowings();
    super.onInit();
  }

  showFollowings() {
    GetFollowDialog(followingsList, "144".tr, "199".tr);
  }

  showFollowers() {
    GetFollowDialog(followersList, "145".tr, "198".tr);
  }
}
