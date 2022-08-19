import 'package:flutter/material.dart';

import '../model/slider_model.dart';

class HomeViewModel extends ChangeNotifier {
  int slideIndex = 0;

  bool get isLastPage => OnBoardModel.slides.length - 1 == slideIndex;

  void incrementAndChange([int? value]) {
    if (isLastPage && value == null) {
      return;
    }
     incrementSelectedPage(value);
  }

  void incrementSelectedPage([int? value]) {
    slideIndex = value ?? slideIndex++;
    notifyListeners();
  }
}
