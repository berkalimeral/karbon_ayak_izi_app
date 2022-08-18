import 'package:flutter/material.dart';

import 'package:karbon_ayak_izi_app/model/footprint_values.dart';
import 'package:karbon_ayak_izi_app/widgets/dropdown_widget.dart';
import 'package:karbon_ayak_izi_app/widgets/question_page_widget.dart';

import '../constants/dummyTexts.dart';
import '../widgets/kaydet_buton_widget.dart';

class QuestionOne extends StatefulWidget {
  Values values;
  int index;
  QuestionOne({
    Key? key,
    required this.values,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionOne> createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  final double dogalgaz_katsayi = 0.19;
  final double komur_katsayi = 2.0;
  final double sivi_yakit_katsayi = 2.975;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                  Text("Hangi ısınma yöntemini kullanıyorsunuz?",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 18)),
                  const DropdownWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
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
                      if (selectedValue == 'dogalgaz') {
                        result =
                            dogalgaz_katsayi * double.parse(controller.text);
                            widget.values.isinma = double.parse(controller.text);
                        debugPrint(result.toString());
                      } else if (selectedValue == 'komur') {
                        result = komur_katsayi * double.parse(controller.text);
                        debugPrint(result.toString());
                      } else {
                        result =
                            sivi_yakit_katsayi * double.parse(controller.text);
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
          isinmaText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
