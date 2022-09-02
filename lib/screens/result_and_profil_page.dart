import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:karbon_ayak_izi_app/screens/users_scores.dart';
import 'package:karbon_ayak_izi_app/services/firebase_authenticate.dart';

import '../viewmodel/login_viewmodel.dart';

class ResultProfilePage extends StatefulWidget {
  double result;
  ResultProfilePage({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  State<ResultProfilePage> createState() => _ResultProfilePageState();
}

class _ResultProfilePageState extends State<ResultProfilePage> {
  FireStoreUtils services = FireStoreUtils();

  final User? user = FirebaseAuth.instance.currentUser;

  late final LoginViewModel loginViewModel;

  addNameAndScore(Map<String, dynamic> data) {
    services.firestore.collection('results').add({
      'scores': widget.result,
      'full_name': data['full_name'],
    });
  }

  @override
  void initState() {
    super.initState();
    loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    const data = 'Karbon Ayak İzim';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          data,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: buildDrawer(context),
      body: ChangeNotifierProvider.value(
        value: loginViewModel,
        builder: (context, child) {
          return buildBody(context);
        },
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    final Future<QuerySnapshot> currentUser = services.firestore
        .collection('users')
        .where("email", isEqualTo: user!.email!)
        .get();

    return Drawer(
      child: FutureBuilder<QuerySnapshot>(
        future: currentUser,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            debugPrint(user!.email);
            return ListView(
              padding: EdgeInsets.zero,
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    debugPrint(data['full_name']);
                    addNameAndScore(data);
                    return Column(children: [
                      UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        accountName: Text(data['full_name'] ?? 'Full Name'),
                        accountEmail: Text(user!.email ?? 'email@gmail.com'),
                      ),
                      ListTile(
                        title: const Text('Karbon Ayak İzim skorları'),
                        leading: const Icon(Icons.equalizer),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserScores(),
                              ));
                        },
                      ),
                      ListTile(
                        title: const Text('Çıkış Yap'),
                        leading: const Icon(Icons.logout),
                        onTap: () {
                          services.Logout(context);
                        },
                      ),
                    ]);
                  })
                  .toList()
                  .cast(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    String kirlilikImg = 'assets/result_images/kirlilik_resim';
    String dogaImg = 'assets/result_images/doga_resim';
    var data = 'Your Score';
    var random = Random().nextInt(2) + 1;
    if (widget.result > 4500) {
      return buildResultPage(
        random: random,
        data: data,
        widget: widget,
        imgPath: kirlilikImg,
      );
    } else {
      return buildResultPage(
          imgPath: dogaImg, random: random, data: data, widget: widget);
    }
  }
}

class buildResultPage extends StatelessWidget {
  String imgPath;
  buildResultPage({
    Key? key,
    required this.imgPath,
    required this.random,
    required this.data,
    required this.widget,
  }) : super(key: key);

  final int random;
  final String data;
  final ResultProfilePage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          '$imgPath$random.jpg',
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          fit: BoxFit.cover,
        ),
        Text(
          data,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black),
        ),
        Text(
          widget.result.toStringAsFixed(2),
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.black38,
              ),
        ),
        Text(
          'Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacakTavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak Tavsiye mesajları olacak',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
// getName() async {
//     var fullName = await services.firestore.collection('users').get();
//     for (var element in fullName.docs) {
//       // debugPrint('id ${element.id}');
//       Map userMap = element.data();
//       // debugPrint(userMap['full_name']);
//     }
//     var userDoc =
//         await services.firestore.doc('users/N1bZqfY8gHHDnzVZhfl7').get();
//     // debugPrint(userDoc.data()!['full_name']);
//   }