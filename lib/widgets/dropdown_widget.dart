import 'package:flutter/material.dart';

String selectedValue = 'dogalgaz';
String selectedValueYakit = 'dizel';
String selectedValueArac = 'otobus';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: DropdownButton(
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value!;
          });
        },
        items: const [
          DropdownMenuItem(value: 'dogalgaz', child: Text('Doğalgaz')),
          DropdownMenuItem(value: 'komur', child: Text('Kömür')),
          DropdownMenuItem(value: 'siviyakit', child: Text('Sıvı Yakıt')),
        ],
        isExpanded: true,
      ),
    );
  }
}

class DropdownWidgetYakit extends StatefulWidget {
  const DropdownWidgetYakit({
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownWidgetYakit> createState() => _DropdownWidgetYakit();
}

class _DropdownWidgetYakit extends State<DropdownWidgetYakit> {


  @override
  Widget build(BuildContext context) {
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
  }
}

class DropdownWidgetArac extends StatefulWidget {
  const DropdownWidgetArac({
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownWidgetArac> createState() => _DropdownWidgetArac();
}

class _DropdownWidgetArac extends State<DropdownWidgetArac> {
  

  @override
  Widget build(BuildContext context) {
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
