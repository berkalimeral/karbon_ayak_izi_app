import '../question_pages/question_one.dart';

class CalculateResult {
  static double result = 0;

  void calculateResult() {
    for (var i = 0; i < finalResult.length; i++) {
      result = finalResult[i] + result;
    }
  }
}
