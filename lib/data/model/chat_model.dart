import 'dart:convert';

class Chats {
  Chats chatsFromJson(String str) => Chats.fromJson(json.decode(str));
  String chatToJson(Chats data) => json.encode(data.toJson());
  Chats({
    this.connections,
    this.chat,
  });

  List<String>? connections;
  List<Chat>? chat;

  factory Chats.fromJson(Map<String, dynamic> json) => Chats(
        connections: List<String>.from(json["connections"]!.map((x) => x)),
        
        chat:
            List<Chat>.from(json["chat"]!.map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {};
}

class Chat {
  Chat({this.penerima, this.pengirim, this.pesan, this.time, this.isRead});
  String? pengirim;
  String? penerima;
  String? pesan;
  String? time;
  bool? isRead;
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
      pengirim: json["pengirim"],
      penerima: json["penerima"],
      pesan: json["pesan"],
      time: json["time"],
      isRead: json["isRead"]);

  Map<String, dynamic> toJson() => {};
}
