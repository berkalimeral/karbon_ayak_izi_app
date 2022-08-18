import 'package:flutter/material.dart';

class ResultProfilePage extends StatefulWidget {
  ResultProfilePage({Key? key}) : super(key: key);

  @override
  State<ResultProfilePage> createState() => _ResultProfilePageState();
}

class _ResultProfilePageState extends State<ResultProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Karbon Ayak İzim',
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
              onTap: () {},
            ),
            ListTile(
              title: const Text('Çıkış Yap'),
              leading: const Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/result_images/doga_resim1.jpg',
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
            '4875',
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
      ),
    );
  }
}
