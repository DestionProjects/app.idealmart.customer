import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/textstyles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';

class PasswordChangeSuccessfully extends StatelessWidget {
  const PasswordChangeSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        leading: Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: CustomColors.green)),
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {})),
      ),
      body: Container(
        alignment: const Alignment(0, -0.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: CustomColors.green),
                child: const Icon(
                  Icons.check_rounded,
                  color: CustomColors.white,
                  size: 200,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 15),
              child: Text(
                'Congrats',
                style: TextStyles.styleELBB,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 23),
              child: Text(
                'Your password Change Successfully',
                style: TextStyles.styleMB,
                textAlign: TextAlign.center,
              ),
            ),
            CustomWidgets.customButton('Return to Login', () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            })
          ]),
        ),
      ),
    );
  }
}

