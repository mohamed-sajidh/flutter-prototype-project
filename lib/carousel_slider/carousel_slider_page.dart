// import 'package:flutter/material.dart';

// class CarouselSliderPage extends StatefulWidget {
//   const CarouselSliderPage({super.key});

//   @override
//   State<CarouselSliderPage> createState() => _CarouselSliderPageState();
// }

// class _CarouselSliderPageState extends State<CarouselSliderPage> {
//   late PageController _pageController;
//   final int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController =
//         PageController(initialPage: _currentPage, viewportFraction: 0.8);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(40.0),
//             child: Center(
//               child: Text(
//                 "Find your styles",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//           ),
//           PageView.builder(
//             controller: _pageController,
//             itemCount: dataList.length,
//             physics: ClampingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return CarouselView(index, itemExtent: null,);
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
