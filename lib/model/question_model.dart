// To parse this JSON data, do
//
//     final questionModel = questionModelFromMap(jsonString);

import 'dart:convert';

QuestionModel questionModelFromMap(String str) => QuestionModel.fromMap(json.decode(str));

String questionModelToMap(QuestionModel data) => json.encode(data.toMap());

class QuestionModel {
    QuestionModel({
        required this.dropdown,
        required this.questionText,
        required this.radioListTile,
    });

    final List<Dropdown> dropdown;
    final List<QuestionText> questionText;
    final List<RadioListTile> radioListTile;

    factory QuestionModel.fromMap(Map<String, dynamic> json) => QuestionModel(
        dropdown: List<Dropdown>.from(json["dropdown"].map((x) => Dropdown.fromMap(x))),
        questionText: List<QuestionText>.from(json["questionText"].map((x) => QuestionText.fromMap(x))),
        radioListTile: List<RadioListTile>.from(json["radioListTile"].map((x) => RadioListTile.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "dropdown": List<dynamic>.from(dropdown.map((x) => x.toMap())),
        "questionText": List<dynamic>.from(questionText.map((x) => x.toMap())),
        "radioListTile": List<dynamic>.from(radioListTile.map((x) => x.toMap())),
    };
}

class Dropdown {
    Dropdown({
        required this.questionOne,
        required this.questionThree,
        required this.questionFour,
    });

    final List<dynamic> questionOne;
    final List<dynamic> questionThree;
    final List<dynamic> questionFour;

    factory Dropdown.fromMap(Map<String, dynamic> json) => Dropdown(
        questionOne: List<dynamic>.from(json["question_one"].map((x) => x)),
        questionThree: List<dynamic>.from(json["question_three"].map((x) => x)),
        questionFour: List<dynamic>.from(json["question_four"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "question_one": List<dynamic>.from(questionOne.map((x) => x)),
        "question_three": List<dynamic>.from(questionThree.map((x) => x)),
        "question_four": List<dynamic>.from(questionFour.map((x) => x)),
    };
}

class QuestionFourClass {
    QuestionFourClass({
        required this.katsayi,
    });

    final List<QuestionFourKatsayi> katsayi;

    factory QuestionFourClass.fromMap(Map<String, dynamic> json) => QuestionFourClass(
        katsayi: List<QuestionFourKatsayi>.from(json["katsayi"].map((x) => QuestionFourKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionFourKatsayi {
    QuestionFourKatsayi({
        required this.otobus,
        required this.tren,
        required this.metro,
        required this.vapur,
    });

    final double otobus;
    final double tren;
    final double metro;
    final double vapur;

    factory QuestionFourKatsayi.fromMap(Map<String, dynamic> json) => QuestionFourKatsayi(
        otobus: json["otobus"].toDouble(),
        tren: json["tren"].toDouble(),
        metro: json["metro"].toDouble(),
        vapur: json["vapur"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "otobus": otobus,
        "tren": tren,
        "metro": metro,
        "vapur": vapur,
    };
}

class QuestionOneClass {
    QuestionOneClass({
        required this.katsayi,
    });

    final List<QuestionOneKatsayi> katsayi;

    factory QuestionOneClass.fromMap(Map<String, dynamic> json) => QuestionOneClass(
        katsayi: List<QuestionOneKatsayi>.from(json["katsayi"].map((x) => QuestionOneKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionOneKatsayi {
    QuestionOneKatsayi({
        required this.dogalgaz,
        required this.komur,
        required this.siviYakit,
    });

    final double dogalgaz;
    final int komur;
    final double siviYakit;

    factory QuestionOneKatsayi.fromMap(Map<String, dynamic> json) => QuestionOneKatsayi(
        dogalgaz: json["dogalgaz"].toDouble(),
        komur: json["komur"],
        siviYakit: json["sivi_yakit"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "dogalgaz": dogalgaz,
        "komur": komur,
        "sivi_yakit": siviYakit,
    };
}

class QuestionThreeClass {
    QuestionThreeClass({
        required this.katsayi,
    });

    final List<QuestionThreeKatsayi> katsayi;

    factory QuestionThreeClass.fromMap(Map<String, dynamic> json) => QuestionThreeClass(
        katsayi: List<QuestionThreeKatsayi>.from(json["katsayi"].map((x) => QuestionThreeKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionThreeKatsayi {
    QuestionThreeKatsayi({
        required this.dizel,
        required this.benzin,
        required this.elektrik,
    });

    final double dizel;
    final int benzin;
    final double elektrik;

    factory QuestionThreeKatsayi.fromMap(Map<String, dynamic> json) => QuestionThreeKatsayi(
        dizel: json["dizel"].toDouble(),
        benzin: json["benzin"],
        elektrik: json["elektrik"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "dizel": dizel,
        "benzin": benzin,
        "elektrik": elektrik,
    };
}

class QuestionText {
    QuestionText({
        required this.questionTwo,
        required this.questionSeven,
        required this.questionEight,
        required this.questionNine,
        required this.questionTen,
    });

    final List<dynamic> questionTwo;
    final List<dynamic> questionSeven;
    final List<dynamic> questionEight;
    final List<dynamic> questionNine;
    final List<dynamic> questionTen;

    factory QuestionText.fromMap(Map<String, dynamic> json) => QuestionText(
        questionTwo: List<dynamic>.from(json["question_two"].map((x) => x)),
        questionSeven: List<dynamic>.from(json["question_seven"].map((x) => x)),
        questionEight: List<dynamic>.from(json["question_eight"].map((x) => x)),
        questionNine: List<dynamic>.from(json["question_nine"].map((x) => x)),
        questionTen: List<dynamic>.from(json["question_ten"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "question_two": List<dynamic>.from(questionTwo.map((x) => x)),
        "question_seven": List<dynamic>.from(questionSeven.map((x) => x)),
        "question_eight": List<dynamic>.from(questionEight.map((x) => x)),
        "question_nine": List<dynamic>.from(questionNine.map((x) => x)),
        "question_ten": List<dynamic>.from(questionTen.map((x) => x)),
    };
}

class QuestionEightClass {
    QuestionEightClass({
        required this.katsayi,
    });

    final List<QuestionEightKatsayi> katsayi;

    factory QuestionEightClass.fromMap(Map<String, dynamic> json) => QuestionEightClass(
        katsayi: List<QuestionEightKatsayi>.from(json["katsayi"].map((x) => QuestionEightKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionEightKatsayi {
    QuestionEightKatsayi({
        required this.ucus,
    });

    final double ucus;

    factory QuestionEightKatsayi.fromMap(Map<String, dynamic> json) => QuestionEightKatsayi(
        ucus: json["ucus"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "ucus": ucus,
    };
}

class QuestionNineClass {
    QuestionNineClass({
        required this.katsayi,
    });

    final List<QuestionNineKatsayi> katsayi;

    factory QuestionNineClass.fromMap(Map<String, dynamic> json) => QuestionNineClass(
        katsayi: List<QuestionNineKatsayi>.from(json["katsayi"].map((x) => QuestionNineKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionNineKatsayi {
    QuestionNineKatsayi({
        required this.kargo,
    });

    final double kargo;

    factory QuestionNineKatsayi.fromMap(Map<String, dynamic> json) => QuestionNineKatsayi(
        kargo: json["kargo"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "kargo": kargo,
    };
}

class QuestionTenClass {
    QuestionTenClass({
        required this.katsayi,
    });

    final List<QuestionTenKatsayi> katsayi;

    factory QuestionTenClass.fromMap(Map<String, dynamic> json) => QuestionTenClass(
        katsayi: List<QuestionTenKatsayi>.from(json["katsayi"].map((x) => QuestionTenKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionTenKatsayi {
    QuestionTenKatsayi({
        required this.kagit,
    });

    final double kagit;

    factory QuestionTenKatsayi.fromMap(Map<String, dynamic> json) => QuestionTenKatsayi(
        kagit: json["kagit"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "kagit": kagit,
    };
}

class QuestionTwoClass {
    QuestionTwoClass({
        required this.katsayi,
    });

    final List<QuestionTwoKatsayi> katsayi;

    factory QuestionTwoClass.fromMap(Map<String, dynamic> json) => QuestionTwoClass(
        katsayi: List<QuestionTwoKatsayi>.from(json["katsayi"].map((x) => QuestionTwoKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionTwoKatsayi {
    QuestionTwoKatsayi({
        required this.elektrik,
    });

    final double elektrik;

    factory QuestionTwoKatsayi.fromMap(Map<String, dynamic> json) => QuestionTwoKatsayi(
        elektrik: json["elektrik"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "elektrik": elektrik,
    };
}

class RadioListTile {
    RadioListTile({
        required this.questionFive,
        required this.questionSix,
    });

    final List<dynamic> questionFive;
    final List<dynamic> questionSix;

    factory RadioListTile.fromMap(Map<String, dynamic> json) => RadioListTile(
        questionFive: List<dynamic>.from(json["question_five"].map((x) => x)),
        questionSix: List<dynamic>.from(json["question_six"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "question_five": List<dynamic>.from(questionFive.map((x) => x)),
        "question_six": List<dynamic>.from(questionSix.map((x) => x)),
    };
}

class QuestionFiveClass {
    QuestionFiveClass({
        required this.katsayi,
    });

    final List<QuestionFiveKatsayi> katsayi;

    factory QuestionFiveClass.fromMap(Map<String, dynamic> json) => QuestionFiveClass(
        katsayi: List<QuestionFiveKatsayi>.from(json["katsayi"].map((x) => QuestionFiveKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionFiveKatsayi {
    QuestionFiveKatsayi({
        required this.hergun,
        required this.birkac,
        required this.hic,
    });

    final double hergun;
    final double birkac;
    final double hic;

    factory QuestionFiveKatsayi.fromMap(Map<String, dynamic> json) => QuestionFiveKatsayi(
        hergun: json["hergun"].toDouble(),
        birkac: json["birkac"].toDouble(),
        hic: json["hic"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "hergun": hergun,
        "birkac": birkac,
        "hic": hic,
    };
}

class QuestionSixClass {
    QuestionSixClass({
        required this.katsayi,
    });

    final List<QuestionSixKatsayi> katsayi;

    factory QuestionSixClass.fromMap(Map<String, dynamic> json) => QuestionSixClass(
        katsayi: List<QuestionSixKatsayi>.from(json["katsayi"].map((x) => QuestionSixKatsayi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "katsayi": List<dynamic>.from(katsayi.map((x) => x.toMap())),
    };
}

class QuestionSixKatsayi {
    QuestionSixKatsayi({
        required this.yes,
        required this.no,
    });

    final double yes;
    final double no;

    factory QuestionSixKatsayi.fromMap(Map<String, dynamic> json) => QuestionSixKatsayi(
        yes: json["yes"].toDouble(),
        no: json["no"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "yes": yes,
        "no": no,
    };
}
