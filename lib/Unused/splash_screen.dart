// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/carousel_widget.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           margin: EdgeInsets.all(5),
//           child: SizedBox(height: 300,),
//         ),
//         bottomNavigationBar: Container(
//           height: 200,
//
//           decoration: const BoxDecoration(
//
//             color: Colors.black87,
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
//           ),
//           child: CarouselSlider(
//             carouselController: CarouselController(),
//             items: const [
//               Carousel('Sit back and never worry about sharing bills with your housemates again!'),
//               Carousel('Sagain!'),
//               Carousel('Sit sharing bills with your housemates again!'),
//               Carousel('sharing bills with your housemates again!'),
//
//             ],
//             options: CarouselOptions(
//               pageViewKey: const PageStorageKey(
//                 4
//               )
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
