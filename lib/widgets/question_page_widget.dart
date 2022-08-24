import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/widgets/title_widget.dart';

class QuestionsPage extends StatelessWidget {
  int index;
  QuestionsPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const TitleWidget(),
        Text(
          '$index/10',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
