import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/constants/dummyTexts.dart';

import '../widgets/dropdown_widget.dart';
import '../widgets/kaydet_buton_widget.dart';
import '../widgets/question_page_widget.dart';

class QuestionSeven extends StatefulWidget {
  int index;
  QuestionSeven({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionSeven> createState() => _QuestionSeven();
}

class _QuestionSeven extends State<QuestionSeven> {
  TextEditingController controller = TextEditingController();

  final double ucus_katsayi = 0.1;
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
                      "Geçtiğimiz yıl kişisel amaç ile kaç adet iç hat uçuşu gerçekleştirdiniz?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Gerçekleştirilen uçuş sayısı',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      result = ucus_katsayi *double.parse(controller.text);
                    },
                    child: KaydetButon(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Text(
          ucakText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
