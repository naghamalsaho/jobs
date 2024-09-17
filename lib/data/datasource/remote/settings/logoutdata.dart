

import 'package:jobs/api_link.dart';

import '../../../../core/class/crud.dart';

class LogoutData {
  Crud crud;
  LogoutData(this.crud);

   logout() async {
    var response = await crud.getData(AppLink.logout);
    print("Response data: $response");

    return response.fold((l) => l, (r) => r);
  }
}

