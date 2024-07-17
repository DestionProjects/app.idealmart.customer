import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';

class CongratulationPage extends StatelessWidget {
  const CongratulationPage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 15),
                  child: Text(
                    'CONGRATULATION!',
                    style: TextStyles.styleEELB,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 23),
                  child: Text(
                    text,
                    style: TextStyles.styleMB,
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(child:CustomWidgets.customButton('Login', () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SignIn()));
              })),
            ),
          )
        ],
      ),
    );
  }
}
