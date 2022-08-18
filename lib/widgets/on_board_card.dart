import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/model/slider_model.dart';

class OnBoardCard extends StatelessWidget {
  SliderModel slider;
  OnBoardCard({
    Key? key,
    required this.slider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(slider.imageAssetPath),
        Text(
          slider.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Text(
          slider.desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
