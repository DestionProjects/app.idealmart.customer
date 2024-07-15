// lib/features/intro/presentation/pages/intro_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/textstyles.dart';
import 'package:idealmart_customer/features/home/presentation/pages/home_page.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/intro_controller.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IntroController controller = Get.put(IntroController());

    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            final content =
                controller.introContent[controller.currentIndex.value];
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: CustomColors.green)),
                    child: ClipOval(
                      child: Image.network(
                        content['image']!,
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => AnimatedSmoothIndicator(
                      activeIndex: controller.currentIndex.value, count: 3,effect: ExpandingDotsEffect(
                      activeDotColor: CustomColors.green,
                      dotColor: CustomColors.grey.withOpacity(0.3)),)),
                  const SizedBox(height: 20),
                  Text(
                    content['title']!,
                    style: TextStyles.styleELBB,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      content['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyles.styleLB,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }),
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>  SignIn()));
              },
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
