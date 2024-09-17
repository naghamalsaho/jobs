class FollowModel {
  int? id;
  String? roles_name;
  String? name;
  String? image;
 
  FollowModel({
    this.id,
    this.roles_name,
    this.name,
    this.image,
   
  });
  factory FollowModel.fromJson(Map<String, dynamic> json) => FollowModel(
        id: json['id']!,
        roles_name: json['roles_name']!,
        name: json['name']!,
        image: json['image'] != null ? json['image']: null,
      );

  Map<String, dynamic> toJson() => {};
}
