import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:karbon_ayak_izi_app/widgets/title_widget.dart';

class QuestionsPage extends StatelessWidget {
  int index;
  QuestionsPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  Widget _buildPageIndicator(bool isCurrentPage) {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        height: isCurrentPage ? 30.0 : 6.0,
        width: isCurrentPage ? 30.0 : 6.0,
        decoration: BoxDecoration(
            color: isCurrentPage ? Colors.grey : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: [
              Colors.green.shade100,
              Colors.green.shade200,
              Colors.green.shade300
            ])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const TitleWidget(),
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < 10; i++)
            i == index
                ? _buildPageIndicator(true)
                : _buildPageIndicator(false),
        ]),
        // Text(
        //   '${(index + 1)}/ 10',
        //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }
}
