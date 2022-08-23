import 'package:flutter/material.dart';

import 'package:karbon_ayak_izi_app/model/question_model.dart';

YesNo? answer = YesNo.yes;
Yemek? answer_yemek = Yemek.hergun;

class RadioButtonWidget extends StatefulWidget {
  QuestionModel questionModel;
  RadioButtonWidget({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.questionModel.id == 6) {
      return Column(
        children: [
          RadioListTile(
            title: Text(widget.questionModel.items![0].text.toString()),
            value: YesNo.yes,
            groupValue: answer,
            onChanged: (YesNo? value) {
              setState(() {
                answer = value;
              });
            },
          ),
          RadioListTile(
            title: Text(widget.questionModel.items![1].text.toString()),
            value: YesNo.no,
            groupValue: answer,
            onChanged: (YesNo? value) {
              setState(() {
                answer = value;
              });
            },
          ),
        ],
      );
    } else {
      return Column(
        children: [
          RadioListTile(
            title: Text(widget.questionModel.items![0].text.toString()),
            value: Yemek.hergun,
            groupValue: answer_yemek,
            onChanged: (Yemek? value) {
              setState(() {
                answer_yemek = value;
              });
            },
          ),
          RadioListTile(
            title: Text(widget.questionModel.items![1].text.toString()),
            value: Yemek.hic,
            groupValue: answer_yemek,
            onChanged: (Yemek? value) {
              setState(() {
                answer_yemek = value;
              });
            },
          ),
          RadioListTile(
            title: Text(widget.questionModel.items![2].text.toString()),
            value: Yemek.birkac,
            groupValue: answer_yemek,
            onChanged: (Yemek? value) {
              setState(() {
                answer_yemek = value;
              });
            },
          ),
        ],
      );
    }
  }
}

enum YesNo { yes, no }

enum Yemek { hergun, hic, birkac }
