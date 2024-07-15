// lib/features/intro/presentation/pages/intro_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  Image.network(
                    content['image']!,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.introContent.length,
                      (index) => Obx(() {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.currentIndex.value == index
                                ? Colors.orange
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    content['title']!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      content['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          }),
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {
                // Action when the button is pressed
              },
              child: Icon(
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
