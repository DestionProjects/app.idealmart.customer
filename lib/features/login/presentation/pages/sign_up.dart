import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/congratulation_page.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';
import 'package:idealmart_customer/features/login/presentation/widgets/login_widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // final SignUpController controller = Get.put(SignUpController());
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController pinCodeController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: CustomColors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Align(
                          alignment: Alignment.center,
                          child: LoginWidgets.headerText('Create new account')),
                    ),
                    // Name
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Full Name', style: TextStyles.styleMB)),
                    const SizedBox(height: 4),
                    LoginWidgets.nameTextField(nameController),
                    const SizedBox(height: 20),
                    // Email
                    Align(
                        alignment: Alignment.centerLeft,
                        child: LoginWidgets.loginText('Email')),
                    const SizedBox(height: 4),
                    LoginWidgets.emailTextField(emailController),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: LoginWidgets.loginText('Phone')),
                    const SizedBox(height: 4),
                    LoginWidgets.phoneTextField(phoneController),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: LoginWidgets.loginText('Pin Code')),
                    const SizedBox(height: 4),
                    LoginWidgets.pinCodeTextField(pinCodeController),
                    const SizedBox(height: 20),
                    // Password
                    Align(
                        alignment: Alignment.centerLeft,
                        child: LoginWidgets.loginText('Password')),
                    const SizedBox(height: 4),
                    PasswordTextField(controller: passwordController),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35),
                      child: CustomWidgets.customButton('Sign up', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CongratulationPage(text: 'Your account has been created')));
                      }),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: LoginWidgets.textAndTextButton(
                            'Already have an account ', 'Sign in', () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()));
                        }, TextStyles.styleMB, Dimensions.largeTextSize)),
                    Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: LoginWidgets.textAndTextButton(
                            'By Signup you agree to the ',
                            'Terms & Conditions',
                            () {},
                            TextStyles.styleSB,
                            Dimensions.smallTextSize)),
                  ]),
                ),
              ),
            ),
          ],
        ));
  }
}
