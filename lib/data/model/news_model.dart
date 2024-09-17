import 'package:jobs/data/model/post_model.dart';

class NewsModel {
  int? id;
  String? title;
  String? body;
  List<ImageModel>? files;
  List<ImageModel>? images;

  String? createdat;

  NewsModel({
    this.id,
    this.title,
    this.body,
    this.files,
    this.images,
    this.createdat,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json['id']!,
        title: json['title']!,
        body: json['body']!,
        files: List<ImageModel>.from(
            json["files"].map((x) => ImageModel.fromJson(x))),
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
        createdat: json['created_at']!,
      );

  Map<String, dynamic> toJson() => {};
}
