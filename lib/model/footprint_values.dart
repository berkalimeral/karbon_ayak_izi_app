import 'package:cloud_firestore/cloud_firestore.dart';

class Values {
  String id;
  double isinma;
  double elektrik;
  double araba;
  double arac;
  double yemek;
  double atik;
  double ic_ucus;
  double dis_ucus;
  double kargo;
  double kagit;
  Values({
    required this.id,
    required this.isinma,
    required this.elektrik,
    required this.araba,
    required this.arac,
    required this.yemek,
    required this.atik,
    required this.ic_ucus,
    required this.dis_ucus,
    required this.kargo,
    required this.kagit,
  });

  factory Values.fromSnapshot(DocumentSnapshot snapshot) {
    return Values(
        id: snapshot.id,
        isinma: snapshot["isinma"],
        elektrik: snapshot["elektrik"],
        araba: snapshot["araba"],
        arac: snapshot["arac"],
        yemek: snapshot["yemek"],
        atik: snapshot["atik"],
        ic_ucus: snapshot["ic_ucus"],
        dis_ucus: snapshot["dis_ucus"],
        kargo: snapshot["kargo"],
        kagit: snapshot["kagit"],);
  }
}
