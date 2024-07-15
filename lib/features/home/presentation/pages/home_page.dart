// lib/features/home/presentation/pages/home_page.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/dimensions.dart';

import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/textstyles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: CustomColors.faintWhite),
            child: IconButton(icon: const Icon(Icons.menu), onPressed: () {})),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: CustomColors.faintWhite),
              child: IconButton(
                  icon: const Icon(Icons.account_balance_wallet_outlined),
                  onPressed: () {})),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyles.styleLB,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CustomColors.faintWhite,
                    prefixIcon: const Icon(Icons.search_rounded),
                    hintText: 'Search your food',
                    hintStyle: TextStyle(
                        fontFamily: Fonts.poppins,
                        fontSize: Dimensions.largeTextSize),
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
                        Icons.store_rounded,
                        color: CustomColors.white,
                      ),
                      onPressed: () {}))
            ],
          ),
          CarouselSlider(
            carouselController: carouselController,
            items: const [
              CarouselDriver(),
              CarouselDriver(),
              CarouselDriver(),
            ],
            options: CarouselOptions(
              viewportFraction: 1,
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
          Obx(() => AnimatedSmoothIndicator(
                activeIndex: controller.carouselIndex.value,
                count: 3,
                effect: ExpandingDotsEffect(
                    activeDotColor: CustomColors.green,
                    dotColor: CustomColors.faintWhite),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Dimensions.widthMQ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CustomColors.white,
            border: Border.all(color: CustomColors.green)),
        child: const Image(image: ExactAssetImage(Images.bg1)),
      ),
    );
  }
}
