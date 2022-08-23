// class QuestionModel {
//   int? id;
//   String? question;
//   String? infoMessage;
//   String? answerType;
//   String? hintText;

//   QuestionModel(
//       {this.id,
//       this.question,
//       this.infoMessage,
//       this.answerType,
//       this.hintText});

//   QuestionModel.fromJson(json) {
//     id = json['id'];
//     question = json['question'];
//     infoMessage = json['info_message'];
//     answerType = json['answer_type'];
//     hintText = json['hintText'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['question'] = question;
//     data['info_message'] = infoMessage;
//     data['answer_type'] = answerType;
//     data['hintText'] = hintText;
//     return data;
//   }
// }

// class QuestionModel {
//   int? id;
//   String? question;
//   String? infoMessage;
//   String? hintText;
//   String? answerType;
//   Katsayi? katsayi;

//   QuestionModel(
//       {this.id,
//       this.question,
//       this.infoMessage,
//       this.hintText,
//       this.answerType,
//       this.katsayi});

//   QuestionModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     question = json['question'];
//     infoMessage = json['info_message'];
//     hintText = json['hintText'];
//     answerType = json['answer_type'];
//     katsayi =
//         json['katsayi'] != null ? Katsayi.fromJson(json['katsayi']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['question'] = question;
//     data['info_message'] = infoMessage;
//     data['hintText'] = hintText;
//     data['answer_type'] = answerType;
//     if (katsayi != null) {
//       data['katsayi'] = katsayi!.toJson();
//     }
//     return data;
//   }
// }

// class Katsayi {
//   double? dogalgaz;
//   int? komur;
//   double? siviYakit;

//   Katsayi({this.dogalgaz, this.komur, this.siviYakit});

//   Katsayi.fromJson(Map<String, dynamic> json) {
//     dogalgaz = json['dogalgaz'];
//     komur = json['komur'];
//     siviYakit = json['sivi_yakit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['dogalgaz'] = dogalgaz;
//     data['komur'] = komur;
//     data['sivi_yakit'] = siviYakit;
//     return data;
//   }
// }

class QuestionModel {
  int? id;
  String? question;
  String? infoMessage;
  String? hintText;
  String? answerType;
  List<Items>? items;

  QuestionModel(
      {this.id,
      this.question,
      this.infoMessage,
      this.hintText,
      this.answerType,
      this.items});

  QuestionModel.fromJson(json) {
    id = json['id'];
    question = json['question'];
    infoMessage = json['info_message'];
    hintText = json['hintText'];
    answerType = json['answer_type'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['info_message'] = infoMessage;
    data['hintText'] = hintText;
    data['answer_type'] = answerType;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? text;
  double? katsayi;

  Items({this.id, this.text, this.katsayi});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    katsayi = json['katsayi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['katsayi'] = katsayi;
    return data;
  }
}
