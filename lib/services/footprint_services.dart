import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karbon_ayak_izi_app/model/footprint_values.dart';

class FootprintServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Values> addValues(
      double isinma,
      double elektrik,
      double araba,
      double arac,
      double yemek,
      double atik,
      double ic_ucus,
      double dis_ucus,
      double kargo,
      double kagit) async {
    var ref = _firestore.collection("persons");

    var documentRef = await ref.add({
      "isinma": isinma,
      "elektrik": elektrik,
      "araba": araba,
      "arac": arac,
      "yemek": yemek,
      "atik": atik,
      "ic_ucus": ic_ucus,
      "dis_ucus": dis_ucus,
      "kargo": kargo,
      "kagit": kagit
    });
    return Values(
        id: documentRef.id,
        isinma: isinma,
        elektrik: elektrik,
        araba: araba,
        arac: arac,
        yemek: yemek,
        atik: atik,
        ic_ucus: ic_ucus,
        dis_ucus: dis_ucus,
        kargo: kargo,
        kagit: kagit);
  }
}
