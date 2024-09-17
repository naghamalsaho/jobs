import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';
class UserData {
  Crud crud;
UserData(this.crud);

  GetUserData(int id) async {
    var response = await crud.getData("${AppLink.getUser}/$id");
    return response.fold((l) => l, (r) => r);
  }


}
