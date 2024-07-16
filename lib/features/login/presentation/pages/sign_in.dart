import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/textstyles.dart';
import 'package:idealmart_customer/features/home/presentation/pages/home_page.dart';
import 'package:idealmart_customer/features/login/presentation/pages/forget_password.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_up.dart';
import 'package:idealmart_customer/features/navigation/presentation/pages/navigation.dart';

import '../controllers/sign_in_controller.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.put(SignInController());
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          leading: Container(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: CustomColors.green)),
                child: Image.asset(
                  Images.bg3,
                  height: 250,
                  width: 250,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 4, top: 8),
                  alignment: Alignment.centerLeft,
                  child: Text('Email or Phone', style: TextStyles.styleLB)),
              TextField(
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
              Container(
                margin: const EdgeInsets.only(bottom: 4, top: 8),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyles.styleLB,
                    )),
              ),
              Obx(
                () => TextField(
                  style: TextStyles.styleLB,
                  obscureText: !controller.isPasswordVisible.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: CustomColors.faintWhite,
                    suffixIcon: IconButton(
                      icon: Icon(controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyles.styleMG,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: CustomWidgets.customButton('Sign in', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Navigation()));
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyles.styleLB,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text("Sign up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: CustomColors.green,
                              color: CustomColors.green,
                              fontFamily: Fonts.poppins,
                              fontSize: Dimensions.largeTextSize)),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
