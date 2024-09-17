import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class VerifyCodeRegisterData {
  Crud crud;
 VerifyCodeRegisterData(this.crud);

  postdata(String verifycode) async {
    var response = await crud.postData(AppLink.verifycoderegister, {
      "code" : verifycode,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => 1, (r) => r);
  }

  
  reSendCodeData (String email) async {
    var response = await crud.postData(AppLink.reSendCode, {
    "email" :  email ,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
