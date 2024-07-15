// lib/features/splash/presentation/pages/splash_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/intro');
    });
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Network image as background
          Image.asset(
            'assets/images/splashBg.png',
            fit: BoxFit.cover,
          ),
          // Local logo image in the center
          Center(
            child: Image.asset(
              'assets/logos/logo_light.png',
              width: 180,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}
