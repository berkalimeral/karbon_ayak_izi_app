import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karbon_ayak_izi_app/model/user_score_model.dart';
import 'package:karbon_ayak_izi_app/services/firebase_authenticate.dart';

class UsersScoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserScoreModel>> getUserScore() {
    return _firestore.collection('users').orderBy('full_name').get().then(
        (querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((entry) => UserScoreModel.fromSnapshot(entry.value))
            .toList());
  }
}
