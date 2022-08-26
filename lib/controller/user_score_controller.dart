import 'package:get/get.dart';
import 'package:karbon_ayak_izi_app/model/user_score_model.dart';
import 'package:karbon_ayak_izi_app/services/users_score_services.dart';

class UserScoreController extends GetxController {
  UsersScoreServices services = UsersScoreServices();
  var scores = Future.value(<UserScoreModel>[]).obs;

  @override
  void onInit() {
    scores.value = services.getUserScore();
    super.onInit();
  }
}
