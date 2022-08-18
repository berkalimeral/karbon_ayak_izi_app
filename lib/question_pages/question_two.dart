import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/widgets/dropdown_widget.dart';
import 'package:karbon_ayak_izi_app/widgets/kaydet_buton_widget.dart';

import '../constants/dummyTexts.dart';
import '../widgets/question_page_widget.dart';

class QuestionTwo extends StatefulWidget {
  int index;
  QuestionTwo({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionTwo> createState() => _QuestionTwoState();
}

class _QuestionTwoState extends State<QuestionTwo> {
  TextEditingController controller = TextEditingController();

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
                  Text("Elektrik tüketim miktarınız ortalama?",
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
                    onTap: () {},
                    child: KaydetButon(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Text(
          elektrikText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
