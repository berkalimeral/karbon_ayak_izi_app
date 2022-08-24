import 'package:flutter/material.dart';

import 'package:karbon_ayak_izi_app/model/question_model.dart';
import 'package:karbon_ayak_izi_app/widgets/dropdown_widget.dart';
import 'package:karbon_ayak_izi_app/widgets/question_page_widget.dart';
import 'package:karbon_ayak_izi_app/widgets/radiobutton_widget.dart';

import '../constants/katsayilar.dart';
import '../widgets/kaydet_buton_widget.dart';

List<double> finalResult = <double>[];

class QuestionOne extends StatefulWidget {
  QuestionModel question;
  int index;
  int answerIndex;
  QuestionOne({
    Key? key,
    required this.question,
    required this.index,
    required this.answerIndex,
  }) : super(key: key);

  @override
  State<QuestionOne> createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  double result = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    if (widget.question.answerType == 'dropdown') {
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
                    Text(widget.question.question!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black, fontSize: 18)),
                    DropdownWidget(questionModel: widget.question),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: widget.question.hintText,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        switch (widget.question.id) {
                          case 1:
                            {
                              if (selectedValue ==
                                  widget
                                      .question.items![widget.answerIndex].id) {
                                result = dogalgaz_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              } else if (selectedValue == 'komur') {
                                result = komur_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              } else {
                                result = sivi_yakit_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              }
                              finalResult.add(result);
                            }
                            break;
                          case 3:
                            {
                              if (selectedValueYakit == 'dizel') {
                                result = dizel_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              } else if (selectedValueYakit == 'benzin') {
                                result = benzin_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              } else {
                                result = elektrik_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              }
                              finalResult.add(result);
                            }
                            break;
                          case 4:
                            {
                              if (selectedValueArac == 'otobus') {
                                result = otobus_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              } else if (selectedValueArac == 'tren') {
                                result = tren_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              } else if (selectedValueArac == 'metro') {
                                result = metro_katsayi *
                                    double.parse(controller.text);
                                debugPrint(result.toString());
                              } else {
                                result = vapur_katsayi *
                                    double.parse(controller.text);
                              }
                              finalResult.add(result);
                              debugPrint(finalResult.toString());
                            }
                        }
                      },
                      child: KaydetButon(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            widget.question.infoMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else if (widget.question.answerType == 'radioListTile') {
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
                    Text(widget.question.question!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black, fontSize: 18)),
                    RadioButtonWidget(questionModel: widget.question),
                    InkWell(
                      onTap: () {
                        switch (widget.question.id) {
                          case 5:
                            {
                              if (answer_yemek == Yemek.hergun) {
                                result = hergun_katsayi;
                              } else if (answer_yemek == Yemek.hic) {
                                result = hic_katsayi;
                              } else {
                                result = birkac_katsayi;
                              }
                              finalResult.add(result);
                            }
                            break;
                          case 6:
                            {
                              if (answer == YesNo.yes) {
                                result = yes_katsayi;
                              } else {
                                result = no_katsayi;
                              }
                              finalResult.add(result);
                              debugPrint(finalResult.toString());
                            }
                            break;
                        }
                      },
                      child: KaydetButon(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            widget.question.infoMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
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
                    Text(widget.question.question!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black, fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: widget.question.hintText,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        switch (widget.question.id) {
                          case 2:
                            {
                              result = elektrikKatsayi *
                                  double.parse(controller.text);
                              finalResult.add(result);
                            }
                            break;
                          case 7:
                            {
                              result = ic_ucus_katsayi *
                                  double.parse(controller.text);
                              finalResult.add(result);
                            }
                            break;
                          case 8:
                            {
                              result = dis_ucus_katsayi *
                                  double.parse(controller.text);
                              finalResult.add(result);
                            }
                            break;
                          case 9:
                            {
                              result =
                                  kargo_katsayi * double.parse(controller.text);
                              finalResult.add(result);
                              debugPrint(finalResult.toString());
                            }
                            break;
                          case 10:
                            {
                              result =
                                  kagit_katsayi * double.parse(controller.text);
                              finalResult.add(result);
                              debugPrint(finalResult.toString());
                            }
                            break;
                        }
                      },
                      child: KaydetButon(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            widget.question.infoMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
  }
}
