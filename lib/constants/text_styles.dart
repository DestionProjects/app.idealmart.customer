import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'dimensions.dart';

class AppStyles {
  static TextStyle defaultTextStyle(
      {double fontSize = 16.0,
      Color color = CustomColors.black,
      String fontFamily = Fonts.poppins,
      FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily);
  }
}

class TextStyles {
  static TextStyle styleLB = AppStyles.defaultTextStyle(
      fontSize: Dimensions.mediumTextSize, color: Colors.black87);
  static TextStyle styleLGB = AppStyles.defaultTextStyle(
      fontSize: Dimensions.largeTextSize,
      color: CustomColors.green,
      fontWeight: FontWeight.bold);
  static TextStyle styleMG = AppStyles.defaultTextStyle(
      fontSize: Dimensions.mediumTextSize, color: CustomColors.green);
  static TextStyle styleLW = AppStyles.defaultTextStyle(
      fontSize: Dimensions.largeTextSize, color: CustomColors.white);
  static TextStyle styleMB =
      AppStyles.defaultTextStyle(fontSize: Dimensions.mediumTextSize);
  static TextStyle styleELBB = AppStyles.defaultTextStyle(
      fontSize: Dimensions.extraLargeTextSize, fontWeight: FontWeight.bold);
  static TextStyle styleEELB = AppStyles.defaultTextStyle(
      fontSize: Dimensions.xxLargeTextSize, fontWeight: FontWeight.bold);
  static TextStyle styleSB =
      AppStyles.defaultTextStyle(fontSize: Dimensions.smallTextSize);
  static TextStyle styleMGrey = AppStyles.defaultTextStyle(
      fontSize: Dimensions.mediumTextSize,
      color: CustomColors.grey.withOpacity(0.5));
  static TextStyle styleXSB = AppStyles.defaultTextStyle(fontSize: Dimensions.xSmallTextSize);
}
