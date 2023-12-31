class UserModel {
  String? id;
  String? username;
  String? email;
  String? photo;
  int? level;
  UserModel(
    this.id,
    this.username,
    this.email,
    this.photo,
    this.level,
  );
  UserModel.fromJson(Map<String, dynamic>? json) {
    username = json!["username"];
    id = json["id"];
    email = json["email"];
    photo = json["photo"];
    level = json["level"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'photo': photo ?? '',
      'level': level,
    };
  }
}
