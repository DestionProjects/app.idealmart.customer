import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:idealmart_customer/features/cart/presentation/pages/cart.dart';
import 'package:idealmart_customer/features/grocery_list/presentation/pages/grocery_list.dart';
import 'package:idealmart_customer/features/home/presentation/pages/home_page.dart';
import 'package:idealmart_customer/features/profile/presentation/pages/profile.dart';
import 'package:idealmart_customer/features/wishlist/presentation/pages/wishlist.dart';
class NavigationController extends GetxController{
  RxInt selectedIndex = 0.obs;
  List<Widget> screens =[
    HomePage(),
    Cart(),
    Wishlist(),
    GroceryList(),
    Profile()
  ];
  List<String> titles = [
    'Home Page',
    'Cart Page',
    'WishList Page',
    'GroceryList Page',
    'Profile Page'
  ];

  void setIndex(int index) {
    selectedIndex.value = index;
  }
}