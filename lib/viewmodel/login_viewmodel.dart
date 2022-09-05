import 'package:flutter/material.dart';

import '../question_pages/question_one.dart';

class LoginViewModel extends ChangeNotifier {
  bool isVisible = true;
  String? inputText;
  double? result;

  void isVisibleChange() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
