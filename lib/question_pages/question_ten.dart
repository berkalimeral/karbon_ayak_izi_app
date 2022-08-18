import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/constants/dummyTexts.dart';
import 'package:karbon_ayak_izi_app/services/footprint_services.dart';

import '../widgets/dropdown_widget.dart';
import '../widgets/kaydet_buton_widget.dart';
import '../widgets/question_page_widget.dart';

class QuestionTen extends StatefulWidget {
  int index;
  QuestionTen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionTen> createState() => _QuestionTen();
}

class _QuestionTen extends State<QuestionTen> {
  TextEditingController controller = TextEditingController();

  FootprintServices footprintServices = FootprintServices();

  final double kagit_katsayi = 0.1;
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
                      "Bir yıl içerisinde ortalama kağıt tüketiminiz kaç kilogramdır?",
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
                        hintText: 'Yıllık tüketilen miktarı giriniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      result = kagit_katsayi * double.parse(controller.text);
                      footprintServices.addValues(result,result,result,result,result,result,result,result,result,result);
                      debugPrint(result.toString());
                    },
                    child: KaydetButon(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Text(
          kagitText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
