import 'dart:io';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class OpportunityData {
  Crud crud;
  OpportunityData(this.crud);
  createOpportunityPostdata(
      String title,
      String body,
      // String location,
      File? file,
      String joptype,
      String workPlaceType,
      String jophours,
      List<String> qualifications,
      List<String> skills,
      String salary,
      String vacant) async {
    var response = await crud.postFileAndData(
        AppLink.addOpportunity,
        {
          "title": title,
          "body": body,
          //"location": location,
          "job_type": joptype,
          "work_place_type": workPlaceType,
          "job_hours": jophours,
          "qualifications": qualifications,
          "skills_req": skills,
          "salary": salary,
          "vacant": vacant,
           "images": file,
           "files" : file
        },
        'images',
        file);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }


 editOpportunityPostdata(
  int id,
      String? title,
      String ?body,
      // String location,
      File ?file,
      String ? joptype,
      String ? workPlaceType,
      String ? jophours,
      List <String> qualifications,
      List <String> skills,
      String ? salary,
      String ? vacant) async {
    var response = await crud.postFileAndData(
        "${AppLink.updateOpportunity}/$id}",
        {
          "_method": "PUT" ,
          "title": title,
          "body": body,
          //"location": location,
          "job_type": joptype,
          "work_place_type": workPlaceType,
          "job_hours": jophours,
          "qualifications": qualifications,
          "skills_req": skills,
          "salary": salary,
          "vacant": vacant,
            "images": file,
           "files" : file
        },
        'images',
        file);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }


  deleteOpportunity(int id) async {
    var response = await crud.deleteData("${AppLink.deleteOpportunity}/$id");
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
