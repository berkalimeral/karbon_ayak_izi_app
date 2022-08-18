import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String mobileNumber;
  String email;
  
  UserModel({
    required this.id,
    required this.name,
    required this.mobileNumber,
    required this.email,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot){
    return UserModel(name: snapshot['name'], mobileNumber: snapshot['mobileNumber'], email: snapshot['email'], id: snapshot.id);
  }

}
