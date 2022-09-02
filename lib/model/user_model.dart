import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String full_name;
  String phone_number;
  String email;

  UserModel({
    required this.id,
    required this.full_name,
    required this.phone_number,
    required this.email,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
        full_name: snapshot['full_name'],
        phone_number: snapshot['phone_number'],
        email: snapshot['email'],
        id: snapshot.id);
  }
}
