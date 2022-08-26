import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karbon_ayak_izi_app/model/user_model.dart';

class UsersServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> addUser(
      String full_name, String phone_number, String email) async {
    var ref = _firestore.collection('users');

    var documentRef = await ref
        .add({'full_name': full_name, 'phone_number': phone_number, 'email': email});

    return UserModel(
        id: documentRef.id,
        full_name: full_name,
        phone_number: phone_number,
        email: email);
  }
}
