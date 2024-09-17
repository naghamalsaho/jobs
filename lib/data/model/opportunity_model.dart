import 'dart:convert';

import 'package:jobs/data/model/post_model.dart';

class OpportunityModel {
  // OpportuntiyModel opportunitFromJson(String str) =>
  //     OpportuntiyModel.fromJson(json.decode(str));
  //String opportuntiyToJson(OpportuntiyModel data) => json.encode(data.toJson());
  int? id;
  int? user_id;
  String? companyid;
  String? companylogo;
  String? companyname;
  String? title;
  String? body;
  String? location;
  String? jopType;
  String? workPlaceType;
  String? jophours;
  List? qualifications;
  List? skills;
  String? salary;
  String? vacant;
   ImageModel? file;
  String? images;
  String? createdat;
  String? updatedat;
  OpportunityModel(
      {this.id,
      this.user_id,
      this.companyid,
      this.companylogo,
      this.companyname,
      this.title,
      this.body,
      this.location,
      this.jopType,
      this.workPlaceType,
      this.jophours,
      this.qualifications,
      this.skills,
      this.salary,
      this.vacant,
      this.images,
    this.file,
      this.createdat,
      this.updatedat});
  factory OpportunityModel.fromJson(Map<String, dynamic> json) =>
      OpportunityModel(
          id: json['id']!,
          user_id: json['user_id']!,
          companyid: json['company_id']!.toString(),
          companylogo: json['company_logo'],
          companyname: json['company_name']!,
          title: json['title']!,
          body: json['body']!,
          location: json['location']!,
          jopType: json['job_type']!,
          workPlaceType: json['work_place_type']!,
          jophours: json['job_hours']!.toString(),
          qualifications: (json['qualifications']! is String)
              ? jsonDecode(json['qualifications']!)
              : json['qualifications']!,
          skills: (json['skills_req']! is String)
              ? jsonDecode(json['skills_req']!)
              : json['skills_req']!,
          salary: json['salary']!.toString(),
          vacant: json['vacant']!.toString(),
       images:
         List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))).isNotEmpty?json["images"][0]['url']:null ,
             createdat: json['created_at_with_time'],
        
      //  file: ImageModel.fromJson(json["files"][0].map((x) => ImageModel.fromJson(x)))   ,
          updatedat: json['updated_at']);

  Map<String, dynamic> toJson() => {};
}
