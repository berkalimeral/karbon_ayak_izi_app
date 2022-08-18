import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karbon_ayak_izi_app/model/user_model.dart';

class UsersServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> addUser(
      String name, String mobileNumber, String email) async {
    var ref = _firestore.collection('users');

    var documentRef = await ref.add({'name': name, 'mobileNumber': mobileNumber, 'email': email});

    return UserModel(id: documentRef.id, name: name, mobileNumber: mobileNumber, email: email);
  }
}
