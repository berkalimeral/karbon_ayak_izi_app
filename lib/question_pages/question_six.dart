import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/constants/dummyTexts.dart';
import 'package:karbon_ayak_izi_app/widgets/radiobutton_widget.dart';

import '../widgets/dropdown_widget.dart';
import '../widgets/kaydet_buton_widget.dart';
import '../widgets/question_page_widget.dart';

class QuestionSix extends StatefulWidget {
  int index;
  QuestionSix({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionSix> createState() => _QuestionSixState();
}

class _QuestionSixState extends State<QuestionSix> {
  TextEditingController controller = TextEditingController();

  final double yes_katsayi = 0.1;
  final double no_katsayi = 0.1;
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
                      "Atıklarınızı geri dönüştürüyor musunuz? (Plastik, Metaller, Cam, Kağıt ve Karton)",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 18)),

                  InkWell(
                    onTap: () {
                      if (answer == YesNo.yes) {
                        result = yes_katsayi;
                      } else {
                        result = no_katsayi;
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
          atikText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
