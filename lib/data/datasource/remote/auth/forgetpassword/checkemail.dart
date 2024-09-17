import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postdata(String email) async {
    var response = await crud.postData(AppLink.checkemail, {
      "email": email,
    });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
