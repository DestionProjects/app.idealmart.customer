// lib/features/intro/presentation/bindings/intro_binding.dart

import 'package:get/get.dart';
import '../controllers/intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController());
  }
}
