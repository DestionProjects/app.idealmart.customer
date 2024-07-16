// lib/features/intro/presentation/pages/intro_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/textstyles.dart';
import 'package:idealmart_customer/features/home/presentation/pages/home_page.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_up.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/intro_controller.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IntroController controller = Get.put(IntroController());

    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Stack(
        children: [
          Obx(() {
            final content =
                controller.introContent[controller.currentIndex.value];
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: CustomColors.green)),
                    child: ClipOval(
                      child: Image.network(
                        content['image']!,
                        width: Dimensions.widthMQ*0.6,
                        height: Dimensions.widthMQ*0.6,
                      ),
                    ),
                  ),
                   SizedBox(height: Dimensions.heightMQ*0.035),
                  Obx(() => AnimatedSmoothIndicator(
                      activeIndex: controller.currentIndex.value, count: 3,effect: ExpandingDotsEffect(
                      activeDotColor: CustomColors.green,

                      dotHeight: 10,dotWidth: 10,
                      dotColor: CustomColors.grey.withOpacity(0.3)),)),
                   SizedBox(height: Dimensions.heightMQ*0.08),
                  Text(
                    content['title']!,
                    style: TextStyles.styleELBB,
                  ),
                   SizedBox(height: Dimensions.heightMQ*0.035),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      content['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyles.styleMB,
                    ),
                  ),
                   SizedBox(height: Dimensions.heightMQ*0.15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                        children: [
                          Expanded(child: GestureDetector(
                            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));},
                            child: Container(
                              alignment: Alignment.center,
                              width: Dimensions.widthMQ,
                              height: 50,
                              decoration: BoxDecoration(
                                color: CustomColors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text('Login',style: TextStyles.styleLW),
                            ),
                          )),
                          const SizedBox(width: 5),
                          Expanded(child: GestureDetector(
                            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));},
                            child: Container(
                              alignment: Alignment.center,
                              width: Dimensions.widthMQ,
                              height: 50,
                              decoration: BoxDecoration(
                                color: CustomColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: CustomColors.green),
                              ),
                              child: Text('Sign up',style: TextStyles.styleLB),
                            ),
                          )),
                        ]
                    ),
                  ),
                ],
              ),
            );
          }),

        ],
      ),
    );
  }
}
