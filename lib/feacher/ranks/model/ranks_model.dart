class RanksModel {
  String? name;
  int? points;
  String? gender;

  RanksModel({
    required this.name,
    required this.points,
    required this.gender,
  });

  // Add this method to convert a map to a RanksModel instance
  factory RanksModel.fromJson(Map<String, dynamic> json) {
    return RanksModel(
      name: json['name'],
      points: json['point'],
      gender: json['gender'],
    );
  }
}
