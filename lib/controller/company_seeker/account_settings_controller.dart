import 'package:get/get.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/model/company.dart';
import 'package:jobs/data/model/seeker.dart';

class AccountSettingsController extends GetxController {
  late String account;
  late String username;
  late String email;
  late String id;
  SeekerModel? seekerModel;
  CompanyModel? companyModel;
  late String? image;

  MyServices myServices = Get.find();
  final profileController = Get.put(GetUserController());
  goToEditProfilePage()  {
  //  await Future.delayed(Duration(seconds: 2));
    account == 'company'
        ?  Get.offNamed(AppRoute.editcompanyProfile,
            arguments: {"companyModel": companyModel})
        :  Get.offNamed(AppRoute.editProfile,
            arguments: {"seekerModel": seekerModel});
  }

  goToProfile() {
    profileController.getUser(int.parse(id));
  }

  @override
  void onInit() async {
    account = myServices.box.read("account");
    username = myServices.box.read("user_name");
    email = myServices.box.read("email");
    id = myServices.box.read("id");
    image = myServices.box.read("image");

    // account == 'company'
    //     ? companyModel = await profileController.getUserInfo(int.parse(id))
    //     : seekerModel = await profileController.getUserInfo(int.parse(id));

    account == 'company'
          ?companyModel =  myServices.box.read("companyModel")
          : seekerModel = myServices.box.read("seekerModel");
    super.onInit();
  }
}
