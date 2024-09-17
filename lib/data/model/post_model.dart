class PostModel {
  int? id;
  int? user_id;
  String? seekerid;
  String? body;
  List<ImageModel> images;
  List<ImageModel> files;
  String? createdat;
  String? updatedat;
  String? createdby;
  String? profileImg;

  PostModel({
    required this.files,
    this.id,
    this.seekerid,
    this.user_id,
    this.body,
    required this.images,
    this.createdat,
    this.updatedat,
    this.createdby,
    this.profileImg,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id']!,
        user_id: json['user_id']!,
        seekerid: json['seeker_id']!.toString(),
        body: json['body']!,
        // file: List<ImageModel>.from(
        //     json["files"].map((x) => ImageModel.fromJson(x))).isNotEmpty?

//json["files"][0]['url'] :null,
        files: List<ImageModel>.from(
            json["files"].map((x) => ImageModel.fromJson(x))),

        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
        createdat: json['created_at'],
        updatedat: json['updated_at'],
        createdby: json['created_by']!,
        profileImg: json['profile_img'],
      );

  Map<String, dynamic> toJson() => {};
}

class ImageModel {
  int? id;
  String? url;
  String? createdat;

  ImageModel({this.id, this.url, this.createdat});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json['id']!,
        url: json['url']!,
        createdat: json['created_at']!,
      );

  Map<String, dynamic> toJson() => {};
}
