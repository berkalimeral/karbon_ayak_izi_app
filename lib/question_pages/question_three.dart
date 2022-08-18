import 'package:flutter/material.dart';

import 'package:karbon_ayak_izi_app/constants/dummyTexts.dart';
import 'package:karbon_ayak_izi_app/widgets/kaydet_buton_widget.dart';

import '../widgets/dropdown_widget.dart';
import '../widgets/question_page_widget.dart';

class QuestionThree extends StatefulWidget {
  int index;
  QuestionThree({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionThree> createState() => _QuestionThreeState();
}

class _QuestionThreeState extends State<QuestionThree> {
  TextEditingController controller = TextEditingController();

  final double dizel_katsayi = 0.19;
  final double benzin_katsayi = 2.0;
  final double elektrik_katsayi = 2.975;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        QuestionsPage(index: widget.index),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      "Otomobiliniz var ise türü ve yakıt cinsini seçiniz. (Yoksa sonraki sayfaya geçiniz.)",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 18)),
                  const DropdownWidgetYakit(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Yıllık gidilen yol mesafesi (km)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (selectedValueYakit == 'dizel') {
                        result = dizel_katsayi * double.parse(controller.text);
                        debugPrint(result.toString());
                      } else if (selectedValueYakit == 'benzin') {
                        result = benzin_katsayi * double.parse(controller.text);
                        debugPrint(result.toString());
                      } else {
                        result =
                            elektrik_katsayi * double.parse(controller.text);
                        debugPrint(result.toString());
                      }
                    },
                    child: KaydetButon(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Text(
          arabaText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
