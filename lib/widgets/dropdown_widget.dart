import 'package:flutter/material.dart';

import 'package:karbon_ayak_izi_app/model/question_model.dart';

String selectedValue = 'dogalgaz';
String selectedValueYakit = 'dizel';
String selectedValueArac = 'otobus';

class DropdownWidget extends StatefulWidget {
  QuestionModel questionModel;
  DropdownWidget({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.questionModel.id == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: DropdownButton(
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value!;
            });
          },
          items: [
            DropdownMenuItem(
                value: widget.questionModel.items![0].id,
                child: Text(widget.questionModel.items![0].text.toString())),
            DropdownMenuItem(
                value: widget.questionModel.items![1].id,
                child: Text(widget.questionModel.items![1].text.toString())),
            DropdownMenuItem(
                value: widget.questionModel.items![2].id,
                child: Text(widget.questionModel.items![2].text.toString())),
          ],
          isExpanded: true,
        ),
      );
    } else if (widget.questionModel.id == 3) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: DropdownButton(
          value: selectedValueYakit,
          onChanged: (String? value) {
            setState(() {
              selectedValueYakit = value!;
            });
          },
          items: const [
            DropdownMenuItem(value: 'dizel', child: Text('Dizel')),
            DropdownMenuItem(value: 'benzin', child: Text('Benzin')),
            DropdownMenuItem(value: 'elektrik', child: Text('Elektrik')),
          ],
          isExpanded: true,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: DropdownButton(
          value: selectedValueArac,
          onChanged: (String? value) {
            setState(() {
              selectedValueArac = value!;
            });
          },
          items: const [
            DropdownMenuItem(value: 'otobus', child: Text('Otobüs')),
            DropdownMenuItem(value: 'tren', child: Text('Tren')),
            DropdownMenuItem(value: 'metro', child: Text('Metro')),
            DropdownMenuItem(value: 'vapur', child: Text('Vapur')),
          ],
          isExpanded: true,
        ),
      );
    }
  }
}
