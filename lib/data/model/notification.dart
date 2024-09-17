import 'package:jobs/data/model/opportunity_model.dart';

class NotificationModel {
  final String id;

  final int objId;
  final String title;
  final String body;
  final DateTime? readAt;
  final DateTime createdAt;
  final OpportunityModel? opportuntiyModel;
  NotificationModel({
    required this.id,
    required this.objId,
    required this.title,
    required this.body,
    this.readAt,
    required this.createdAt,
    this.opportuntiyModel,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      objId: json['obj_id'],
      title: json['title'],
      body: json['body'],
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
      opportuntiyModel: json['opportuntiy'] != null
          ? OpportunityModel.fromJson(json['opportuntiy'])
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'obj_id': objId,
      'title': title,
      'body': body,
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'opportuntiy': opportuntiyModel?.toJson(),
    };
  }
}
