import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/core/widgets/imagecontainer.dart';
import 'package:idealmart_customer/features/home/presentation/widgets/home_widgets.dart';
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
          decoration: const BoxDecoration(
            // color: CustomColors.faintWhite,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Iconsax.menu_1),
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              // color: CustomColors.faintWhite,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(Iconsax.notification),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyles.styleMB,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          filled: true,
                          fillColor: CustomColors.faintWhite,
                          prefixIcon: const Icon(Iconsax.search_favorite, size: 20),
                          hintText: 'Search your Grocery',
                          hintStyle: TextStyle(
                            fontFamily: Fonts.poppins,
                            fontSize: Dimensions.smallTextSize,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.green,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(10),
                        icon: const Icon(
                          Iconsax.shop,
                          color: CustomColors.white,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
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
              Obx(
                () => AnimatedSmoothIndicator(
                  activeIndex: controller.carouselIndex.value,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: CustomColors.green,
                    dotColor: CustomColors.black.withOpacity(0.3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: HomeWidgets.categoryHeader('Categories', (){}),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HomeWidgets.categoryCard('Banana',(){}),
                        HomeWidgets.categoryCard('Banana',(){}),
                        HomeWidgets.categoryCard('Banana',(){}),
                        HomeWidgets.categoryCard('Banana',(){}),
                        HomeWidgets.categoryCard('Banana',(){}),
                      ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                child: HomeWidgets.productHeader('Offer 1',(){}),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                child: HomeWidgets.productHeader('Offer 2',(){}),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                child: HomeWidgets.productHeader('Offer 3',(){}),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                        HomeWidgets.productCard(Images.bg3, '57', 'Banana', '2-3lb', '2.30',
                            '4.00', () {}, () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
