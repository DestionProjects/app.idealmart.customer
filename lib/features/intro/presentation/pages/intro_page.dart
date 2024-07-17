// lib/features/intro/presentation/pages/intro_page.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_up.dart';
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40), // Space at the top
                  Center(child: imageCarousel(content['image']!)),
                  SizedBox(
                      height: 20), // Adjust space between image and indicator
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
                  SizedBox(
                      height: Dimensions.widthMQ *
                          0.08), // Adjust space between indicator and text
                  Center(child: titleCarousel(content['title']!)),
                  SizedBox(height: 20),
                  Center(child: descriptionCarousel(content['description']!)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: actionButton('Login', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    }),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: actionButtonNoBorder('Signup', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget imageCarousel(String imageURL) {
    return Container(
      width: Dimensions.widthMQ * 0.7, // Adjust the size as needed
      height: Dimensions.widthMQ * 0.7, // Adjust the size as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: CustomColors.green, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Padding between image and circle
        child: ClipOval(
          child: Image.network(
            imageURL,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget titleCarousel(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.styleELBB,
    );
  }

  Widget descriptionCarousel(String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyles.styleLB,
      ),
    );
  }

  Widget actionButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          // color: CustomColors.green,
          border: Border.all(color: CustomColors.green, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text, style: TextStyles.styleLGB),
      ),
    );
  }

  Widget actionButtonNoBorder(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: CustomColors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text, style: TextStyles.styleLW),
      ),
    );
  }
}
