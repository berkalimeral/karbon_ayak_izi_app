class QuestionsModel {
  String question;
  List<String> answer;
  QuestionsModel({
    required this.question,
    required this.answer,
  });

  String getQuestion() {
    return question;
  }
  List<String> getAnswer() {
    return answer;
  }
}

  List<QuestionsModel> getQuestions() {
    List<QuestionsModel> questionAndAnswer = <QuestionsModel>[];

    QuestionsModel questionsModel1 =
        QuestionsModel(question: "Hangi ısınma yöntemini kullanıyorsunuz?", answer: ["Doğalgaz","Sıvı Yakıt","Kömür"]);
    questionAndAnswer.add(questionsModel1);

    return questionAndAnswer;
  }
