import 'package:flutter/material.dart';

class Dimensions {
  static final heightMQ = MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.single)
      .size
      .height;
  static final widthMQ = MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.single)
      .size
      .width;
  static final aspectRatioMQ = MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.single)
      .size
      .aspectRatio;

  static final largeTextSize = widthMQ * 0.042;
  static final extraLargeTextSize = widthMQ * 0.05;
  static final mediumTextSize = widthMQ * 0.035;
  static final smallTextSize = widthMQ * 0.03;
}
