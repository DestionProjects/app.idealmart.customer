// lib/features/intro/presentation/controllers/intro_controller.dart

import 'package:get/get.dart';

class IntroController extends GetxController {
  var currentIndex = 0.obs;

  final List<Map<String, String>> introContent = [
    {
      'image':
          'https://img.freepik.com/premium-vector/smiling-delivery-man-running-with-cardbox-courier-uniform-work-cartoon-character-vector-illustration-isolated-white-background_223337-2309.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Title 1',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.',
    },
    {
      'image':
          'https://img.freepik.com/premium-vector/boy-walking-carrying-goods-return-village-vacation_10606-6396.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Title 2',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.',
    },
    {
      'image':
          'https://img.freepik.com/premium-vector/girl-with-basket-food-her-hands-gets-out-phone-concept-online-orders_638425-249.jpg?ga=GA1.1.1751976739.1720021447&semt=ais_user',
      'title': 'Title 3',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.',
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
