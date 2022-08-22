// To parse this JSON data, do
//
//     final DenemeModel = DenemeModelFromMap(jsonString);

import 'dart:convert';

DenemeModel denemeModelFromMap(String str) => DenemeModel.fromMap(json.decode(str));

String denemeModelToMap(DenemeModel data) => json.encode(data.toMap());

class DenemeModel {
    DenemeModel({
        required this.questions,
    });

    final List<String> questions;

    factory DenemeModel.fromMap(Map<String, dynamic> json) => DenemeModel(
        questions: List<String>.from(json["questions"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "questions": List<dynamic>.from(questions.map((x) => x)),
    };
}
