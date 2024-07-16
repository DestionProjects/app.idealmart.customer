// lib/features/home/presentation/pages/home_page.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/dimensions.dart';

import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/textstyles.dart';
import 'package:idealmart_customer/core/widgets/imagecontainer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final CarouselController carouselController = CarouselController();
  @override
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: Text('Home', style: TextStyles.styleELBB),
        backgroundColor: CustomColors.white,
        leading: Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(color: CustomColors.faintWhite,shape: BoxShape.circle),
            child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: const Icon(Iconsax.menu_1), onPressed: () {})),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(color: CustomColors.faintWhite,shape: BoxShape.circle),
              child: IconButton(
                splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(Iconsax.notification), onPressed: () {})),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyles.styleMB,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CustomColors.faintWhite,
                    prefixIcon: const Icon(Iconsax.search_favorite),
                    hintText: 'Search your Grocery',
                    hintStyle: TextStyle(
                        fontFamily: Fonts.poppins,
                        fontSize: Dimensions.mediumTextSize),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(100)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: CustomColors.green),
                  child: IconButton(
                      icon: const Icon(
                        Iconsax.shop,
                        color: CustomColors.white,
                      ),
                      onPressed: () {}))
            ],
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            carouselController: carouselController,
            items: const [
              CarouselDriver(),
              CarouselDriver(),
              CarouselDriver(),
            ],
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 2,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                controller.carouselIndex.value = index;
              },
            ),
          ),
          const SizedBox(height: 8),
          Obx(() => AnimatedSmoothIndicator(
                activeIndex: controller.carouselIndex.value,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: CustomColors.green,
                    dotColor: CustomColors.black.withOpacity(0.3)),
              ))
        ]),
      ),
    );
  }
}

class CarouselDriver extends StatelessWidget {
  const CarouselDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Dimensions.widthMQ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.white,
        ),
        child: CustomImageContainer(
          imageUrl:
              'https://img.freepik.com/premium-vector/modern-purple-sale-voucher-design_1017-9464.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
          height: screenSize.height * 0.25,
          width: screenSize.width * 0.75,
          borderRadius: 12.0,
        ),
      ),
    );
  }
}
