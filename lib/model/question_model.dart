class QuestionModel {
  int? id;
  String? question;
  String? infoMessage;
  String? answerType;
  String? hintText;

  QuestionModel(
      {this.id,
      this.question,
      this.infoMessage,
      this.answerType,
      this.hintText});

  QuestionModel.fromJson(json) {
    id = json['id'];
    question = json['question'];
    infoMessage = json['info_message'];
    answerType = json['answer_type'];
    hintText = json['hintText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['info_message'] = infoMessage;
    data['answer_type'] = answerType;
    data['hintText'] = hintText;
    return data;
  }
}
