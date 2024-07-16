import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/features/navigation/presentation/controller/navigation_controller.dart';
import 'package:iconsax/iconsax.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: controller.screens[controller.selectedIndex.value],
          )),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_cart),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: 'Favorites',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.document),
              label: 'Orders',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          backgroundColor: CustomColors.faintWhite,
          selectedItemColor: CustomColors.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => controller.setIndex(index),
        );
      }),
    );
  }
}
