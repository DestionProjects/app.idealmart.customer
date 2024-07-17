// lib/features/intro/presentation/pages/intro_page.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/intro_controller.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    final IntroController controller = Get.put(IntroController());

    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Obx(() {
        final content = controller.introContent[controller.currentIndex.value];
        return Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.5),
              child: imageCarousel(content['image']!),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: titleCarousel(content['title']!),
                    ),
                    SizedBox(height: Dimensions.heightMQ * 0.02),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: descriptionCarousel(content['description']!),
                    ),
                    SizedBox(height: Dimensions.heightMQ * 0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => AnimatedSmoothIndicator(
                            activeIndex: controller.currentIndex.value,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              activeDotColor: CustomColors.green,
                              dotHeight: 10,
                              dotWidth: 10,
                              dotColor: CustomColors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                        loginButton(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget imageCarousel(String imageURL) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // border: Border.all(color: CustomColors.green),
        ),
        child: Image.network(
          imageURL,
          fit: BoxFit.contain,
          width: Dimensions.widthMQ * 0.7,
          height: Dimensions.widthMQ * 0.7,
        ),
      ),
    );
  }

  Widget titleCarousel(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyles.styleELBB,
    );
  }

  Widget descriptionCarousel(String description) {
    return Text(
      description,
      textAlign: TextAlign.left,
      style: TextStyles.styleLB,
    );
  }

  Widget loginButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: Dimensions.widthMQ * 0.3,
        height: 50,
        decoration: BoxDecoration(
          color: CustomColors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text('Login', style: TextStyles.styleLW),
      ),
    );
  }
}
