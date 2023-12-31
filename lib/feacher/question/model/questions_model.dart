class QuestionsModel {
  //
  String? question;
  AnswerModel? answer1;
  AnswerModel? answer2;
  AnswerModel? answer3;
  AnswerModel? answer4;

  QuestionsModel.fromJson(Map<String, dynamic>? json) {
    question = json!["question"];
    answer1 = AnswerModel.fromJson(json["1"]);
    answer2 = AnswerModel.fromJson(json["2"]);
    answer3 = AnswerModel.fromJson(json["3"]);
    answer4 = AnswerModel.fromJson(json["4"]);
  }
}

class AnswerModel {
  //
  String? answer;
  bool? correct;
  int? point;
  AnswerModel.fromJson(Map<String, dynamic>? json) {
    answer = json!["answer"];
    correct = json["correct"];
    point = json["point"];
  }
}
