import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/features/navigation/presentation/controller/navigation_controller.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar: Obx(() => NavigationBar(
          backgroundColor: CustomColors.faintWhite,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) => controller.setIndex(index),
                indicatorColor: CustomColors.green,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(FluentIcons.home_12_regular), label: ''),
                  NavigationDestination(
                      icon: Icon(Icons.shopping_cart_outlined), label: ''),
                  NavigationDestination(
                      icon: Icon(Icons.favorite_border_rounded), label: ''),
                  NavigationDestination(
                      icon: Icon(Icons.list_alt_rounded), label: ''),
                  NavigationDestination(
                      icon: Icon(Icons.person_outline_rounded), label: ''),
                ])),
        body: Obx(() => Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: controller.screens[controller.selectedIndex.value],
            )));
  }
}
