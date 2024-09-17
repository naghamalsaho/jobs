import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class ReportData {
  Crud crud;
  ReportData(this.crud);

  reportUser(int id ,String reason_id, String? another_reason, String? who) async {
    var response = await crud.postData("${AppLink.reportUser}/$id",
        {
        "reason_id": reason_id,
         "another_reason": another_reason,
         "who" :who
         });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  reportOpportunity(int id ,String reason_id, String? another_reason) async {
    var response = await crud.postData("${AppLink.reportOpportunity}/$id",
        {
        "reason_id": reason_id,
         "another_reason": another_reason,
         });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
   reportPost(int id ,String reason_id, String? another_reason) async {
    var response = await crud.postData("${AppLink.reportPost}/$id",
        {
        "reason_id": reason_id,
         "another_reason": another_reason,
         });
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
