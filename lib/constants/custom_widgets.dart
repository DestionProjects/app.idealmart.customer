import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/text_styles.dart';


import 'dimensions.dart';
import 'fonts_colors.dart';

class CustomWidgets{
  static Widget customButton(String buttonText, VoidCallback onTap){
    return  GestureDetector(
      onTap: onTap,
      child: Container(
          width: Dimensions.widthMQ,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: CustomColors.green,
              borderRadius: BorderRadius.circular(4)),
          child: Text(
           buttonText,
            style: TextStyles.styleLW,
          )),
    );
  }
}