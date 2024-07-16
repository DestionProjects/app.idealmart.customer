import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/features/home/presentation/pages/home_page.dart';
import 'package:idealmart_customer/features/intro/presentation/bindings/intro_binding.dart';
import 'package:idealmart_customer/features/intro/presentation/pages/intro_page.dart';
import 'features/splash/presentation/bindings/splash_binding.dart';
import 'features/splash/presentation/pages/splash_page.dart';
// import 'features/home/presentation/pages/home_page.dart'; // Uncomment and use later

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.green),
        textSelectionTheme: TextSelectionThemeData(cursorColor: CustomColors.black,selectionColor: CustomColors.green.withOpacity(0.5),selectionHandleColor: CustomColors.green),
        useMaterial3: true,
      ),
      initialBinding: SplashBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/intro',
          page: () => IntroPage(),
          binding: IntroBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ), // Uncomment and use later
      ],
    );
  }
}
