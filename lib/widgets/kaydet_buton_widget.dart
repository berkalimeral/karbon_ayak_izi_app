import 'package:flutter/material.dart';

class KaydetButon extends StatelessWidget {
  const KaydetButon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 30,
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Text(
        'KAYDET',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
