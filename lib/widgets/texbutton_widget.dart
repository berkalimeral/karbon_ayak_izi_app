import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final int slideIndex;
  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.slideIndex,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.animateToPage(slideIndex,
            duration: const Duration(milliseconds: 400), curve: Curves.linear);
      },
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}