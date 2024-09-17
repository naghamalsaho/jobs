import 'dart:convert';

class SeekerModel {
  int? id;
  String? user_name;
  String? email;
  String? created_at;
  String? type;
  String? first_name;
  String? last_name;
  String? gender;
  String? birth_day;
  String? location;
  String? image;
  List? skills;
  List? certificates;
  String? about;
  String? specialization;
  
  String? contactInfoEmail;
  String? contactInfoPhone;
  String? contactInfoGitHub;
  String? contactInfoeWebsite;
  SeekerModel(
      {this.id,
      this.user_name,
      this.email,
      this.created_at,
      this.type,
      this.first_name,
      this.last_name,
      this.gender,
      this.birth_day,
      this.location,
      this.image,
      this.skills,
      this.certificates,
      this.about,
        this.contactInfoEmail,
            this.contactInfoPhone,
      this.contactInfoGitHub,
      this.contactInfoeWebsite,

      this.specialization});
  factory SeekerModel.fromJson(Map<String, dynamic> json) => SeekerModel(
      id: json['id']!,
      user_name: json['user_name']!,
      email: json['email']!,
      created_at: json['created_at']!,
      type: json['type']!,
      first_name: json['more_info']['first_name'],
      last_name: json['more_info']['last_name'],
      gender: json['more_info']['gender'],
      birth_day: json['more_info']['birth_day'],
      location: json['more_info']['location'],
      image: json['more_info']['image'],
       contactInfoEmail: json['more_info']['contact_info']['email'],
        contactInfoPhone: json['more_info']['contact_info']['phone'],
        contactInfoGitHub: json['more_info']['contact_info']['gitHub'],
        contactInfoeWebsite: json['more_info']['contact_info']['website'],
      skills: (json['more_info']['skills'] is String)
          ? jsonDecode(json['more_info']['skills'])
          : json['more_info']['skills'],
      certificates: (json['more_info']['certificates'] is String)
          ? jsonDecode(json['more_info']['certificates'])
          : json['more_info']['certificates'],
      about: json['more_info']['about'],
      specialization: json['more_info']['specialization']);

  Map<String, dynamic> toJson() => {};
}
