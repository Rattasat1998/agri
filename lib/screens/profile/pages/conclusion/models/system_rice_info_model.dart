class SystemRiceInfoModel {
  SystemRiceInfoModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final Data? data;

  factory SystemRiceInfoModel.fromJson(Map<String, dynamic> json){
    return SystemRiceInfoModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.questions,
  });

  final Map<String, Question> questions;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      questions: Map.from(json["questions"]).map((k, v) => MapEntry<String, Question>(k, Question.fromJson(v))),
    );
  }

}

class Question {
  Question({
    required this.question,
    required this.answer,
  });

  final String? question;
  final String? answer;

  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
      question: json["question"],
      answer: json["answer"],
    );
  }

}
