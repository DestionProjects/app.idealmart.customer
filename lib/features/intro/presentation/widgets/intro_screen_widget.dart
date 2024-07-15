// // lib/features/intro/presentation/widgets/intro_screen_widget.dart

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/intro_controller.dart';

// class IntroScreenWidget extends StatelessWidget {
//   final PageController pageController;
//   final List<Map<String, String>> introData;

//   IntroScreenWidget({
//     required this.pageController,
//     required this.introData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final IntroController controller = Get.find<IntroController>();

//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background image
//           Image.network(
//             'https://img.freepik.com/free-photo/woman-holding-vegetables-bag-phone-mock-up_23-2148332090.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
//             fit: BoxFit.cover,
//           ),
//           // Overlay for the black section
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: MediaQuery.of(context).size.height / 2.5,
//               color: Colors.black.withOpacity(0.7),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Page indicators
//                   Obx(() => Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(introData.length, (index) {
//                           return Container(
//                             margin: EdgeInsets.symmetric(horizontal: 4.0),
//                             width: 10.0,
//                             height: 10.0,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: controller.currentIndex.value == index
//                                   ? Colors.orange
//                                   : Colors.white,
//                             ),
//                           );
//                         }),
//                       )),
//                   SizedBox(height: 20),
//                   // Title
//                   Obx(() => Text(
//                         introData[controller.currentIndex.value]['title']!,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )),
//                   SizedBox(height: 10),
//                   // Description
//                   Obx(() => Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Text(
//                           introData[controller.currentIndex.value]
//                               ['description']!,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//           ),
//           // Bottom Button
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: FloatingActionButton(
//                 backgroundColor: Colors.orange,
//                 child: Icon(Icons.arrow_forward, color: Colors.white),
//                 onPressed: () {
//                   controller.nextPage();
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
