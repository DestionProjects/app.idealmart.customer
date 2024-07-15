import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/textstyles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/password_change_successfully.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          title: Text('Forgot Password', style: TextStyles.styleLB),
          backgroundColor: CustomColors.white,
          centerTitle: true,
          scrolledUnderElevation: 0,
          excludeHeaderSemantics: true,
          leading: Container(
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomColors.green)),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {})),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(children: [
                Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: CustomColors.green)),
                  child: Image.asset(Images.intro6),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Please enter your registered email address below. We will send you an email with instructions on how to reset your password.',
                    style: TextStyles.styleMB,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 15),
                  child: Text(
                    'Enter the Email',
                    style: TextStyles.styleELBB,
                  ),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  style: TextStyles.styleLB,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CustomColors.faintWhite,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(6)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: CustomWidgets.customButton('Continue', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PasswordChangeSuccessfully()));
                  }),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text('Return to Login', style: TextStyles.styleLG))
              ]),
            ),
          ),
        ));
  }
}

