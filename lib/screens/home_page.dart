import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/screens/carbon_footprint_calc.dart';
import 'package:karbon_ayak_izi_app/widgets/on_board_card.dart';
import 'package:karbon_ayak_izi_app/widgets/tab_indicator_widget.dart';
import '../model/slider_model.dart';
import '../widgets/texbutton_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int slideIndex = 0;
  late PageController controller;

  bool get _isLastPage => OnBoardModel.slides.length - 1 == slideIndex;

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      return;
    }
    _incrementSelectedPage(value);
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      slideIndex = value ?? slideIndex++;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: OnBoardModel.slides.length,
                itemBuilder: (context, index) {
                  return OnBoardCard(slider: OnBoardModel.slides[index]);
                },
                controller: controller,
                onPageChanged: (index) {
                  _incrementAndChange(index);
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet:
          _isLastPage ? buildStartedButton(context) : buildButtomSheet(),
    );
  }

  Container buildButtomSheet() {
    var next = 'NEXT';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // TextButtonWidget(
            //   controller: controller,
            //   text: 'SKIP',
            //   color: Colors.blue,
            //   slideIndex: slideIndex + 2,
            // ),
            TabIndicator(
              selectedIndex: slideIndex,
            ),
            TextButtonWidget(
                text: next,
                color: Colors.green,
                slideIndex: slideIndex + 1,
                controller: controller)
          ],
        ),
      ),
    );
  }

  InkWell buildStartedButton(BuildContext context) {
    const data = "GET STARTED NOW";
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CarbonFootprintForm(),
            ));
      },
      child: Container(
        height: 60,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text(
          data,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}



// class SlideTile extends StatelessWidget {
//   final String imagePath, title, desc;

//   const SlideTile(
//       {Key? key,
//       required this.imagePath,
//       required this.title,
//       required this.desc})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Image.asset(imagePath),
//           const SizedBox(
//             height: 40,
//           ),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 20,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Text(desc,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14,
//               ))
//         ],
//       ),
//     );
//   }
// }
// children: <Widget>[
                //   SlideTile(
                //     imagePath: mySLides[0].getImageAssetPath(),
                //     title: mySLides[0].getTitle(),
                //     desc: mySLides[0].getDesc(),
                //   ),
                //   SlideTile(
                //     imagePath: mySLides[1].getImageAssetPath(),
                //     title: mySLides[1].getTitle(),
                //     desc: mySLides[1].getDesc(),
                //   ),
                //   SlideTile(
                //     imagePath: mySLides[2].getImageAssetPath(),
                //     title: mySLides[2].getTitle(),
                //     desc: mySLides[2].getDesc(),
                //   )
                // ],

  //               Widget _buildPageIndicator(bool isCurrentPage) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 2.0),
  //     height: isCurrentPage ? 10.0 : 6.0,
  //     width: isCurrentPage ? 10.0 : 6.0,
  //     decoration: BoxDecoration(
  //       color: isCurrentPage ? Colors.grey : Colors.grey[300],
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //   );
  // }