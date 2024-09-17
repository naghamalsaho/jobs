import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postdata(String username, String password, String email,
      String accountType) async {
    print("pppppp");
    var response = await crud.postData(AppLink.signup, {
      "user_name": username,
      "email": email,
      "password": password,
      "roles_name": accountType,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
