class CompanyModel {
  int? id;
  String? user_name;
  String? email;
  String? created_at;
  String? type;
  String? company_name;
  String? logo;
  String? location;
  String? about;
  String? domain;

  String? contactInfoEmail;
  String? contactInfoPhone;
  String? contactInfoGitHub;
  String? contactInfoeWebsite;
  CompanyModel(
      {this.id,
      this.user_name,
      this.email,
      this.created_at,
      this.type,
      this.company_name,
      this.logo,
      this.location,
      this.about,
      this.contactInfoEmail,
            this.contactInfoPhone,
      this.contactInfoGitHub,
      this.contactInfoeWebsite,

      this.domain});
  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json['id']!,
        user_name: json['user_name']!,
        email: json['email']!,
        created_at: json['created_at']!,
        type: json['type']!,
        company_name: json['more_info']['company_name']!,
        logo: json['more_info']['logo'],
        location: json['more_info']['location']!,
        about: json['more_info']['about']!,
        domain: json['more_info']['domain']!,
        contactInfoEmail: json['more_info']['contact_info']['email'],
        contactInfoPhone: json['more_info']['contact_info']['phone'],
        contactInfoGitHub: json['more_info']['contact_info']['gitHub'],
        contactInfoeWebsite: json['more_info']['contact_info']['website'],
      );

  Map<String, dynamic> toJson() => {};
}
