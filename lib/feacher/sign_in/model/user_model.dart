class UserModel {
  String? id;
  String? username;
  String? email;
  String? gender;
  String? college;
  String? department;
  int? year;
  int? phone;
  int? point;
  UserModel({
    this.id,
    this.username,
    this.email,
    this.gender,
    this.college,
    this.department,
    this.year,
    this.phone,
    this.point,
  });
  UserModel.fromJson(Map<String, dynamic>? json) {
    username = json!["name"];
    id = json["id"];
    email = json["email"];
    gender = json["gender"];
    year = json["year"];
    phone = json["phone"];
    point = json["point"];
    college = json["college"];
    department = json["department"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': username,
      'email': email,
      'gender': gender,
      'year': year,
      'phone': phone,
      'point': point,
      'college': college,
      'department': department,
    };
  }
}
