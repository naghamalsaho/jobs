import 'dart:convert';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class CvData {
  Crud crud;
  CvData(this.crud);

  postCvData(
    String? full_name,
    String? birth_day,
    String? location,
    String? about,
    List? skills,
    List? certificates,
    List? lunguages,
    List? projects,
    List? experiences,
    List? contacts,
  ) async {
    var response = await crud.create(
        AppLink.createCV,
        json.encode({
          "full_name": full_name,
          "birth_day": birth_day,
          "location": location,
          "about": about,
          "skills": skills!.map((controller) => controller.text).toList(),
          "certificates":
              certificates!.map((controller) => controller.text).toList(),
          "languages": lunguages!.map((controller) => controller.text).toList(),
          "projects": projects!.map((controller) => controller.text).toList(),
          "experiences":
              experiences!.map((controller) => controller.text).toList(),
          "contacts": contacts!.map((controller) => controller.text).toList(),
        }));
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
