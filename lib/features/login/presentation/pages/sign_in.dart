// lib/features/login/presentation/pages/sign_in.dart

import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/forget_password.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_up.dart';
import 'package:idealmart_customer/features/navigation/presentation/pages/navigation.dart';

import '../widgets/login_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    // final SignInController controller = Get.put(SignInController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: CustomColors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    // Add the image widget here
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: CustomColors.green),
                              shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.asset(
                              Images
                                  .bg3, // Replace with your image URL or asset
                              width: Dimensions.widthMQ *
                                  0.6, // Set the width according to your requirement
                              height: Dimensions.widthMQ *
                                  0.6, // Set the height according to your requirement
                            ),
                          ),
                        ),
                      ),
                    ),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: LoginWidgets.loginText('Email')),
                    const SizedBox(height: 4),
                    LoginWidgets.emailTextField(emailController),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: LoginWidgets.loginText('Password')),
                    const SizedBox(height: 4),
                    PasswordTextField(controller: passwordController),
                    const SizedBox(height: 4),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPassword()));
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyles.styleMG,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35),
                      child: CustomWidgets.customButton('Sign in', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Navigation()));
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35),
                      child: LoginWidgets.textAndTextButton(
                          "Don't have an account? ", 'Register', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      }, TextStyles.styleMB, Dimensions.largeTextSize),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ));
  }
}
