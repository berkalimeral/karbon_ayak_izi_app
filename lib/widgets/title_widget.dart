import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/constants/dummyTexts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return const Text(
      titleText,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
    );
  }
}
