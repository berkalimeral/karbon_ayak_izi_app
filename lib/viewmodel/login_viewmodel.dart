import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isVisible = true;
  String? inputText;

  void isVisibleChange() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
