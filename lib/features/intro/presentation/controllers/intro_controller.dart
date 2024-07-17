// lib/features/intro/presentation/controllers/intro_controller.dart

import 'package:get/get.dart';

class IntroController extends GetxController {
  var currentIndex = 0.obs;

  final List<Map<String, String>> introContent = [
    {
      'image':
          // 'https://img.freepik.com/premium-photo/happy-luxury-asian-woman-travel-shopping-urban-city-vibrant-fashion-contemporary-lifestyle_148840-46625.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
          'https://img.freepik.com/premium-photo/white-business-woman-using-his-smartphone-outside_62972-19654.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Select Your Store',
      'description':
          'Pick your preferred store from our list of trusted partners to view their specific deals',
    },
    {
      'image':
          'https://img.freepik.com/premium-photo/shopping-supermaket-store-young-woman-casual-attire-pays-with-her-credit-card_28914-39785.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Explore Deals',
      'description':
          'Checkout list of deals available for preferred store and choose what best for you.',
    },
    {
      'image':
          'https://img.freepik.com/premium-photo/indian-shopkeepers-customers-engaging-retail-online-shopping_978786-36685.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Enjoy Your Savings',
      'description':
          'Earn rewards and loyalty points with every purchase to save even more in the future.',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 3), () {
      currentIndex.value = (currentIndex.value + 1) % introContent.length;
      _startTimer();
    });
  }
}
