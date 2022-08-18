import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isVisible = false;
  String? inputText;

  void isVisibleChange() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
