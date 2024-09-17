import 'dart:convert';

class UserModel {
  UserModel chatsFromJson(String str) => UserModel.fromJson(json.decode(str));
  String chatToJson(UserModel data) => json.encode(data.toJson());
  String? id;
  String? name;
  String? email;
  String? keyName;
  String? creationTime;
  String? lastSignInTime;
  String? status;
  String? updatedTime;
  List<ChatUser>? chats;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.keyName,
      this.creationTime,
      this.lastSignInTime,
      this.status,
      this.updatedTime,
      this.chats});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        keyName: json['keyName'],
        creationTime: json['ceationTime'],
        lastSignInTime: json['lastSignInTime'],
        status: json['status'],
        updatedTime: json['updatedTime'],
      );

  Map<String, dynamic> toJson() => {};
}

class ChatUser {
  String? connection;
  String? chatId;
  String? lastTime;
  int? totalunread;

  ChatUser({this.connection, this.chatId, this.lastTime, this.totalunread});

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        connection: json['connection'],
        chatId: json['chat_id'],
        lastTime: json['lastTime'],
        totalunread: json['total_unread']
      );
}
