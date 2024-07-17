// lib/features/login/presentation/pages/sign_up.dart

import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/congratulation_page.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';
import 'package:idealmart_customer/features/login/presentation/widgets/login_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add the image widget here
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 35),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: CustomColors.green),
                              shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.asset(
                              Images.bg3,
                              // Replace with your image URL or asset
                              width: Dimensions.widthMQ * 0.4,
                              // Set the width according to your requirement
                              height: Dimensions.widthMQ *
                                  0.4, // Set the height according to your requirement
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to',
                            style: TextStyles.styleELBB,
                          ),
                          Text(
                            ' !DealMart',
                            style: TextStyle(
                                color: CustomColors.green,
                                fontSize: Dimensions.extraLargeTextSize,
                                fontFamily: Fonts.poppins,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Text('Full Name', style: TextStyles.styleMB),
                            const SizedBox(height: 4),
                            LoginWidgets.nameTextField(nameController),
                            const SizedBox(height: 20),
                            // Email
                            Text('Email', style: TextStyles.styleMB),
                            const SizedBox(height: 4),
                            LoginWidgets.emailTextField(emailController),
                            const SizedBox(height: 20),
                            // Phone
                            Text('Phone Number', style: TextStyles.styleMB),
                            const SizedBox(height: 4),
                            LoginWidgets.phoneTextField(phoneController),
                            const SizedBox(height: 20),
                            // Pin Code
                            Text('Pin Code', style: TextStyles.styleMB),
                            const SizedBox(height: 4),
                            LoginWidgets.pinCodeTextField(pinCodeController),
                            const SizedBox(height: 20),
                            // Password
                            Text('Password', style: TextStyles.styleMB),
                            const SizedBox(height: 4),
                            PasswordTextField(controller: passwordController),
                            const SizedBox(height: 20),
                          ],
                        )),

                    // Terms and Conditions
                    Row(
                      children: [
                        Checkbox(
                          value: isAgreed,
                          activeColor:
                              CustomColors.green, // Set the active color
                          onChanged: (value) {
                            setState(() {
                              isAgreed = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            'By signing up, you agree to our Terms & Conditions and Privacy Policy',
                            style: TextStyles.styleSB,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Sign Up Button
                    Center(
                      child: CustomWidgets.customButton('Sign Up', () {
                        if (_formKey.currentState!.validate()) {
                          if (isAgreed) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CongratulationPage(
                                  text: 'Your account has been created',
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'You must agree to the terms and conditions to sign up.'),
                              ),
                            );
                          }
                        }
                      }),
                    ),
                    const SizedBox(height: 20),
                    // Already have an account
                    Center(
                      child: LoginWidgets.textAndTextButton(
                        'Already have an account? ',
                        'Login',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                        TextStyles.styleMB,
                        Dimensions.largeTextSize,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
