import 'package:flutter/material.dart';

YesNo? answer = YesNo.yes;
Yemek? answer_yemek = Yemek.hergun;

class RadioButtonWidget extends StatefulWidget {
  RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text('Evet'),
          value: YesNo.yes,
          groupValue: answer,
          onChanged: (YesNo? value) {
            setState(() {
              answer = value;
            });
          },
        ),
        RadioListTile(
          title: const Text('Hayır'),
          value: YesNo.no,
          groupValue: answer,
          onChanged: (YesNo? value) {
            setState(() {
              answer = value;
            });
          },
        ),
      ],
    );
  }
}

enum YesNo { yes, no }

class RadioButtonWidgetYemek extends StatefulWidget {
  RadioButtonWidgetYemek({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidgetYemek> createState() => _RadioButtonWidgetYemek();
}

class _RadioButtonWidgetYemek extends State<RadioButtonWidgetYemek> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text('Her gün et tüketiyorum'),
          value: Yemek.hergun,
          groupValue: answer_yemek,
          onChanged: (Yemek? value) {
            setState(() {
              answer_yemek = value;
            });
          },
        ),
        RadioListTile(
          title: const Text('Öğünlerimde et tüketmiyorum'),
          value: Yemek.hic,
          groupValue: answer_yemek,
          onChanged: (Yemek? value) {
            setState(() {
              answer_yemek = value;
            });
          },
        ),
        RadioListTile(
          title: const Text('Haftada birkaç kez et tüketiyorum'),
          value: Yemek.birkac,
          groupValue: answer_yemek,
          onChanged: (Yemek? value) {
            setState(() {
              answer_yemek = value;
            });
          },
        ),
      ],
    );
  }
}

enum Yemek { hergun, hic, birkac }
