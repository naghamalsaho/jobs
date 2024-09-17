import 'dart:io';
import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);

  createPostdata(
      String firstname,
      String lastname,
      String birthday,
      String location,
      File? image,
      List<String> skills,
      List<String> certificates,
      String specialization,
      String? contactInfoEmail,
      String? contactInfoPhone,
      String? contactInfoGitHub,
      String? contactInfoeWebsite,
      String about,
      String gender) async {
    var response = await crud.postFileAndData(
        AppLink.createprofile,
        {
          "first_name": firstname,
          "last_name": lastname,
          "birth_day": birthday,
          "location": location,
          "skills": skills,
          "certificates": certificates,
          "specialization": specialization,
          "contact_info[email]": contactInfoEmail,
          "contact_info[phone]": contactInfoPhone,
          "contact_info[linkedin]": null,
          "contact_info[gitHub]": contactInfoGitHub,
          "contact_info[website]": contactInfoeWebsite,
          "about": about,
          "gender": gender
        },
        'image',
        image);
    print("daataaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }

  updatePostdata(
      String firstname,
      String lastname,
      String birthday,
      String location,
      File? image,
      List<String> skills,
      List<String> certificates,
      String specialization,
       String? contactInfoEmail,
      String ?contactInfoPhone,
      String? contactInfoGitHub,
      String ?contactInfoeWebsite,
      String about,
      String gender) async {
    var response = await crud.postFileAndData(
        AppLink.updateprofile,
        {
          "_method": "PUT",
          "first_name": firstname,
          "last_name": lastname,
          "birth_day": birthday,
          "location": location,
          "skills": skills,
          "certificates": certificates,
          "specialization": specialization,
           "contact_info[email]": contactInfoEmail,
          "contact_info[phone]": contactInfoPhone,
          "contact_info[linkedin]": null,
          "contact_info[gitHub]": contactInfoGitHub,
          "contact_info[website]": contactInfoeWebsite,
          "about": about,
          "gender": gender
        },
        'image',
        image);
    print("daaaaaaaaaaaaaaaa $response");
    return response.fold((l) => l, (r) => r);
  }
}
