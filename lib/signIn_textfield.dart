 // Widget buildTextFormEmail(
  //     String text, TextEditingController controller, IconData icon) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         text,
  //         style: Theme.of(context).textTheme.headline6,
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             boxShadow: const [
  //               BoxShadow(
  //                   color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
  //             ]),
  //         child: TextFormField(
  //           controller: controller,
  //           keyboardType: TextInputType.emailAddress,
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             prefixIcon: Icon(
  //               icon,
  //               color: const Color(0xff5ac18e),
  //             ),
  //             hintText: text,
  //             hintStyle: const TextStyle(color: Colors.black38),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget buildTextFormPassword(String text, TextEditingController controller,
  //     IconData icon, Widget suffixIcon) {
  //   bool isVisible = false;
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         text,
  //         style: Theme.of(context).textTheme.headline6,
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             boxShadow: const [
  //               BoxShadow(
  //                   color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
  //             ]),
  //         child: TextFormField(
  //           obscureText: context.watch<LoginViewModel>().isVisible,
  //           controller: controller,
  //           keyboardType: TextInputType.emailAddress,
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             suffixIcon: IconButton(
  //               icon: suffixIcon,
  //               onPressed: () {
  //                 setState(() {
  //                   context.read<LoginViewModel>().isVisibleChange();
  //                   // loginViewModel.isVisibleChange();
  //                 });
  //               },
  //             ),
  //             prefixIcon: Icon(
  //               icon,
  //               color: const Color(0xff5ac18e),
  //             ),
  //             hintText: text,
  //             hintStyle: const TextStyle(color: Colors.black38),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

   // Widget buildTextFormField(String text, TextEditingController controller,
  //     IconData icon, bool obsecureText) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         text,
  //         style: Theme.of(context).textTheme.headline6,
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //             boxShadow: const [
  //               BoxShadow(
  //                   color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
  //             ]),
  //         child: TextFormField(
  //           obscureText: obsecureText,
  //           controller: controller,
  //           keyboardType: TextInputType.emailAddress,
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             prefixIcon: Icon(
  //               icon,
  //               color: const Color(0xff5ac18e),
  //             ),
  //             hintText: text,
  //             hintStyle: const TextStyle(color: Colors.black38),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // intro

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