// import 'package:get/get.dart';
// import 'package:jobs/core/class/statusrequest.dart';
// import 'package:jobs/core/functions/handlingdata.dart';
// import 'package:jobs/data/datasource/remote/testdata.dart';

// class testcontroller extends GetxController {
//   TestData testData = TestData(Get.find());

//   List data = [];
//   late StatusRequest statusRequest;

//   getData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await testData.getData();
//     print("================$response  Controller");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }
