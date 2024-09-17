import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class LoginData {
  Crud crud;
 LoginData(this.crud);

  postdata(String email , String password) async {
    
    var response = await crud.postData(AppLink.login, {
      "login": email,
      "password": password,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }


  device_token(String ?device_token) async {
    var response = await crud.postData(AppLink.device_token, {
      "token": device_token,
    });
    print("daataaaaaaaaaaaaaaa $response");
        print("daataaaaaaaaaaaaaaa ${response}");

    return response.fold((l) => l, (r) => r);
  }
}
