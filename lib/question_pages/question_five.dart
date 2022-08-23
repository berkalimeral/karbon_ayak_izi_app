import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/constants/dummyTexts.dart';
import 'package:karbon_ayak_izi_app/widgets/radiobutton_widget.dart';
import '../widgets/kaydet_buton_widget.dart';
import '../widgets/question_page_widget.dart';

class QuestionFive extends StatefulWidget {
  int index;
  QuestionFive({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionFive> createState() => _QuestionFiveState();
}

class _QuestionFiveState extends State<QuestionFive> {
  TextEditingController controller = TextEditingController();

  final double hergun_katsayi = 0.1;
  final double birkac_katsayi = 0.1;
  final double hic_katsayi = 0.1;
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
                  Text("Yemek alışkanlıklarınızı tanımlar mısınız?",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 18)),

                  InkWell(
                    onTap: () {
                      if (answer_yemek == Yemek.hergun) {
                        result = hergun_katsayi;
                      } else if (answer_yemek == Yemek.hic) {
                        result = hic_katsayi;
                      } else {
                        result = birkac_katsayi;
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
          yemeText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
