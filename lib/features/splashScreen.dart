// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../consts/images.dart';
// import '../controllers/splashController.dart';

// class SplashScreen extends StatelessWidget {
//   final animate = Get.put(SplashController());

//   @override
//   Widget build(BuildContext context) {
//     animate.startAnimation();
//     return SafeArea(
//       child: Scaffold(
//           body: Stack(
//         children: [
//           Obx(() => AnimatedPositioned(
//                 bottom: 100,
//                 duration: Duration(),
//                 child: Image(image: AssetImage(musicIcon)),
//               )),
//         ],
//       )),
//     );
//   }
// }
