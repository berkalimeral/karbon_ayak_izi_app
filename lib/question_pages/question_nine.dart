import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/constants/dummyTexts.dart';

import '../widgets/dropdown_widget.dart';
import '../widgets/kaydet_buton_widget.dart';
import '../widgets/question_page_widget.dart';

class QuestionNine extends StatefulWidget {
  int index;
  QuestionNine({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionNine> createState() => _QuestionNine();
}

class _QuestionNine extends State<QuestionNine> {
  TextEditingController controller = TextEditingController();

  final double kargo_atsayi = 0.1;
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
                      "Ayda kaç kez kargo hizmeti kullanıyorsunuz? (Getir, Banabi, vb.)",
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
                        hintText: 'Aylık kullanılan miktarı giriniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      result = kargo_atsayi * double.parse(controller.text);
                    },
                    child: KaydetButon(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Text(
          kargoText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
