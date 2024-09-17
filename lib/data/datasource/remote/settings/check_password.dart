import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class checkPasswordData {
  Crud crud;
  checkPasswordData(this.crud);

  postData(String Password) async {
    var response =
        await crud.postData(AppLink.checkPassword, {"password": Password});
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
