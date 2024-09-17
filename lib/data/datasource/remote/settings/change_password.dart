import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class changePasswordData {
  Crud crud;
  changePasswordData(this.crud);

  postData(String Password, String password_confirmation) async {
    var response = await crud.postData(AppLink.changepassword,
        {
        "password": Password,
         "password_confirmation": password_confirmation});
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
