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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        emailError = 'Please enter your email';
      } else {
        final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        if (!emailPattern.hasMatch(value)) {
          emailError = 'Enter a valid email';
        } else {
          emailError = null;
        }
      }
    });
  }

  void validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        passwordError = 'Please enter your password';
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.green),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          Images.bg3,
                          width: Dimensions.widthMQ * 0.4,
                          height: Dimensions.widthMQ * 0.4,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  'Shop Smart, Save Big on Groceries!',
                  style: TextStyles.styleELBB.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email or Phone',
                    style: TextStyles.styleMB,
                  ),
                ),
                const SizedBox(height: 4),
                LoginWidgets.emailTextField(emailController, emailError),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyles.styleMB,
                  ),
                ),
                const SizedBox(height: 4),
                PasswordTextField(
                    controller: passwordController, errorText: passwordError),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPassword()),
                      );
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyles.styleMG.copyWith(
                        color: CustomColors.green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                CustomWidgets.customButton('Sign in', () {
                  validateEmail(emailController.text);
                  validatePassword(passwordController.text);
                  if (emailError == null && passwordError == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Navigation()),
                    );
                  }
                }),
                const SizedBox(height: 20),
                LoginWidgets.textAndTextButton(
                  "Don't have an account? ",
                  'Sign up',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  TextStyles.styleMB,
                  Dimensions.largeTextSize,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
