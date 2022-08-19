import 'package:flutter/material.dart';

import 'package:karbon_ayak_izi_app/constants/dummyTexts.dart';
import 'package:karbon_ayak_izi_app/widgets/kaydet_buton_widget.dart';

import '../widgets/dropdown_widget.dart';
import '../widgets/question_page_widget.dart';

class QuestionFour extends StatefulWidget {
  int index;
  QuestionFour({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionFour> createState() => _QuestionFourState();
}

class _QuestionFourState extends State<QuestionFour> {
  TextEditingController controller = TextEditingController();

  final double otobus_katsayi = 0.09;
  final double tren_katsayi = 0.11;
  final double metro_katsayi = 0.09;
  final double vapur_katsayi = 0.47;
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
                  Text("Ulaşım için hangi aracı kullanıyorsunuz?",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 18)),
                  const DropdownWidgetArac(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
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
                      if (selectedValueArac == 'otobus') {
                        result = otobus_katsayi * double.parse(controller.text);
                        debugPrint(result.toString());
                      } else if (selectedValueArac == 'tren') {
                        result = tren_katsayi * double.parse(controller.text);
                        debugPrint(result.toString());
                      } else if (selectedValueArac == 'metro') {
                        result = metro_katsayi * double.parse(controller.text);
                        debugPrint(result.toString());
                      } else {
                        result = vapur_katsayi * double.parse(controller.text);
                        debugPrint(result.toString());
                      }
                    },
                    child: KaydetButon(),
                  )
                ],
              ),
            ),
          ),
        ),
        const Text(
          arabaText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
