// lib/features/intro/presentation/controllers/intro_controller.dart

import 'package:get/get.dart';

class IntroController extends GetxController {
  var currentIndex = 0.obs;

  final List<Map<String, String>> introContent = [
    {
      'image':
          'https://img.freepik.com/premium-vector/mobile-commerce-concept-web-banner-woman-making-purchases-ordering-website-shop_9209-7350.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Select Your Store',
      'description':
          'Pick your preferred store from our list of trusted partners to view their specific deals',
    },
    {
      'image':
          'https://img.freepik.com/premium-vector/young-girl-opens-smartphone-accesses-online-shop-selecting-buying-shoes-bags_923732-531.jpg?w=826',
      'title': 'Explore Deals',
      'description':
          'Checkout list of deals available for preferred store and choose what best for you.',
    },
    {
      'image':
          'https://img.freepik.com/premium-vector/online-shopping-store-with-mobile-concept-chat-message-delivery-24-hours-service_24797-1199.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
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
