import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserScoreModel {
  String? userName;
  double? userScore;
  charts.Color? barColor;
  UserScoreModel({
    required this.userName,
    required this.userScore,
    this.barColor,
  }) {
    barColor = charts.ColorUtil.fromDartColor(Colors.black);
  }

  factory UserScoreModel.fromSnapshot(DocumentSnapshot snap) {
    return UserScoreModel(
        userName: snap['full_name'], userScore: snap['user_score']);
  }

  static final List<UserScoreModel> data = [
    UserScoreModel(userName: 'Berk Ali', userScore: 4800),
    UserScoreModel(userName: 'Ahmet', userScore: 3750.45),
    UserScoreModel(userName: 'Ali', userScore: 3300),
    UserScoreModel(userName: 'Ayşe', userScore: 2750),
    UserScoreModel(userName: 'Emre', userScore: 5195.23),
    UserScoreModel(userName: 'Gül', userScore: 4513.85),
    UserScoreModel(userName: 'Fatma', userScore: 4413),
    UserScoreModel(userName: 'Eren', userScore: 5219.95),
    UserScoreModel(userName: 'Samet', userScore: 2210),
    UserScoreModel(userName: 'Berk', userScore: 4500),
  ];
}
