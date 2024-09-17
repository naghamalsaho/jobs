
 
class ProposedCompanyModel {
  int? user_id;
  int? company_id;
  String? company_name;
  String? logo;
  String? location;
  String? about;
  String? domain;
  String? contact_info;
  
  ProposedCompanyModel({
    this.user_id,
    this.company_id,
    this.company_name,
    this.logo,
    this.location,
    this.about,
    this.domain,
    this.contact_info,
    
  });
  factory ProposedCompanyModel.fromJson(Map<String, dynamic> json) => ProposedCompanyModel(
        user_id: json['user_id']!,
        company_id: json['company_id']!,
        company_name: json['company_name']!,
        logo: json['logo'],
        location: json['location']!,
        about: json['about']!,
        domain: json['domain']!,
        contact_info: json['contact_info']['email'],
       
      );

  Map<String, dynamic> toJson() => {};
}
