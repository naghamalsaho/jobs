import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class SearchUserData {
  Crud crud;

  SearchUserData(this.crud);
  searchUser(String username) async {
    var response = await crud.getData("${AppLink.searchPath}/$username");
    return response.fold((l) => l, (r) => r);
  }
}
