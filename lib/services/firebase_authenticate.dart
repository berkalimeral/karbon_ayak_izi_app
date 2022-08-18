import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../screens/home_page.dart';

class FireStoreUtils {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      });
      // .catchError((error) {
      //  buildErrorMessage(error.message);
      // }) diyerekte hata mesajlarını yazdırabiliriz
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "wrong-password":
          return buildErrorMessage("E-Mail veya şifre hatalı.");
        case "user-not-found":
          return buildErrorMessage("Böyle bir kullanıcı bulunamadı.");
        case "invalid-email":
          return buildErrorMessage("E-mail adresi geçersiz!");
        default:
          return "Login failed. Please try again.";
      }
    }

    Fluttertoast.showToast(
      msg: "Giriş Başarılı...", // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      // duration
    );
  }

  void buildErrorMessage(String message) {
    Fluttertoast.showToast(
      msg: message, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      // duration
    );
  }

  void Logout(BuildContext context) async {
    try {
      print("try içi");
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    var _userCredential = await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
    debugPrint(_userCredential.toString());
    await firestore
        .collection('users')
        .doc(_userCredential.user!.uid)
        .set({'email': email, 'password': password});
  }

  void ResetPassword(String mail) async {
    try {
      await auth.sendPasswordResetEmail(email: mail);
      print("email sent");
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
