// lib/features/intro/presentation/controllers/intro_controller.dart

import 'package:get/get.dart';

class IntroController extends GetxController {
  var currentIndex = 0.obs;

  final List<Map<String, String>> introContent = [
    {
      'image':
          'https://img.freepik.com/premium-vector/smiling-delivery-man-running-with-cardbox-courier-uniform-work-cartoon-character-vector-illustration-isolated-white-background_223337-2309.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Crafting Culinary Magic',
      'description':
          'Our expert chefs prepare your order with love and precision, ensuring a delectable experience.',
    },
    {
      'image':
          'https://img.freepik.com/premium-vector/boy-walking-carrying-goods-return-village-vacation_10606-6396.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Fast and Reliable Delivery',
      'description':
          'Get your orders delivered swiftly and safely, straight to your doorstep.',
    },
    {
      'image':
          'https://img.freepik.com/premium-vector/girl-with-basket-food-her-hands-gets-out-phone-concept-online-orders_638425-249.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Join Our Community',
      'description':
          'Be a part of our growing family and enjoy exclusive benefits and offers.',
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
