import 'package:jobs/core/class/crud.dart';
import '../../../../api_link.dart';

class DeleteAccountData {
  Crud crud;
  DeleteAccountData(this.crud);

   deleteAccount() async {
    var response = await crud.deleteData(AppLink.deleteaccount);
    print("Response data: $response");

  
    return response.fold(
      (l) => l,
      (r) => r
    );
  }
}
