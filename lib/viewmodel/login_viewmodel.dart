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

  void calculateResult() {
    for (var i = 0; i < finalResult.length; i++) {
      result = finalResult[i] + result!;
    }
    debugPrint(result.toString());
    notifyListeners();
  }
}
