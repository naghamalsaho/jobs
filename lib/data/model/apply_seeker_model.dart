class ApplySeekerModel {
  int? id;
  String? opportunity_name;
  String? company_name;
  String? status;
  String? createdat;
  String? company_logo;
  ApplySeekerModel({
    this.id,
    this.opportunity_name,
    this.company_name,
    this.status,
    this.createdat,
    this.company_logo,
  });
  factory ApplySeekerModel.fromJson(Map<String, dynamic> json) =>
      ApplySeekerModel(
        id: json['id']!,
        opportunity_name: json['opportunity_name']!,
        company_name: json['company_name']!,
        status: json['status'],
        createdat: json['created_at'],
        company_logo: json['company_logo']
      );

  Map<String, dynamic> toJson() => {};
}
