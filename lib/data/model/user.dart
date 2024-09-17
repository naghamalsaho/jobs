class User {
  String? id;

  User({this.id});
  User.fromjson(Map<String, dynamic> json) {
    id = json['id'];
  }
}
