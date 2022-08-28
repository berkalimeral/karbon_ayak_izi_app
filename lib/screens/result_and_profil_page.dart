import 'dart:math';

import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/screens/users_scores.dart';
import 'package:provider/provider.dart';

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

  late final LoginViewModel loginViewModel;

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              accountName: Text('Berk Ali Meral'),
              accountEmail: Text('berkalisimsek@hotmail.com'),
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
          ],
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: loginViewModel,
        builder: (context, child) {
          return buildBody(context);
        },
      ),
    );
  }

  Column buildBody(BuildContext context) {
    if (widget.result > 4500) {
      var random = Random().nextInt(2) + 1;
      return Column(
        children: [
          Image.asset(
            'assets/result_images/kirlilik_resim$random.jpg',
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            fit: BoxFit.cover,
          ),
          Text(
            'Your Score',
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
    } else {
      var random = Random().nextInt(2) + 1;
      return Column(
        children: [
          Image.asset(
            'assets/result_images/doga_resim$random.jpg',
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            fit: BoxFit.cover,
          ),
          Text(
            'Your Score',
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
}
