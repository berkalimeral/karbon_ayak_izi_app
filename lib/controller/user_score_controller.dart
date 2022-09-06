import 'package:get/get.dart';
import 'package:karbon_ayak_izi_app/model/user_score_model.dart';
import 'package:karbon_ayak_izi_app/services/firebase_authenticate.dart';

class UserScoreController extends GetxController {
  final FireStoreUtils services = FireStoreUtils();
  var scores = Future.value(<UserScoreModel>[]).obs;

  @override
  void onInit() {
    scores.value = services.getUserScore();
    super.onInit();
  }
}
