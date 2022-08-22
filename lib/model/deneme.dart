import 'dart:convert';

DenemeModel denemeModelFromMap(String str) => DenemeModel.fromMap(json.decode(str));

String denemeModelToMap(DenemeModel data) => json.encode(data.toMap());

class DenemeModel {
    DenemeModel({
        required this.id,
        required this.question,
        required this.infoMessage,
        required this.answerType,
    });

    final int id;
    final String question;
    final String infoMessage;
    final String answerType;

    factory DenemeModel.fromMap(Map<String, dynamic> json) => DenemeModel(
        id: json["id"],
        question: json["question"],
        infoMessage: json["info_message"],
        answerType: json["answer_type"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "question": question,
        "info_message": infoMessage,
        "answer_type": answerType,
    };
}
