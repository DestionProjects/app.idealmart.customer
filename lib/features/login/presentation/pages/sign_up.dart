import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
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
  final MaskedTextController phoneController =
      MaskedTextController(mask: '000-000-0000');
  final MaskedTextController pinCodeController =
      MaskedTextController(mask: 'A0A 0A0');
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isAgreed = false;

  String? nameError;
  String? emailError;
  String? phoneError;
  String? pinCodeError;
  String? passwordError;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    pinCodeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateName(String value) {
    setState(() {
      if (value.isEmpty) {
        nameError = 'Please enter your Full Name';
      } else {
        nameError = null;
      }
    });
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

  void validatePhone(String value) {
    setState(() {
      if (value.isEmpty) {
        phoneError = 'Please enter your phone number';
      } else {
        final canadaPhonePattern = RegExp(r'^\d{3}-\d{3}-\d{4}$');
        if (!canadaPhonePattern.hasMatch(value)) {
          phoneError = 'Enter a valid phone number (XXX-XXX-XXXX)';
        } else {
          phoneError = null;
        }
      }
    });
  }

  void validatePinCode(String value) {
    setState(() {
      if (value.isEmpty) {
        pinCodeError = 'Please enter your pincode';
      } else {
        final canadaPinCodePattern =
            RegExp(r'^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$');
        if (!canadaPinCodePattern.hasMatch(value)) {
          pinCodeError = 'Enter a valid pincode (A1A 1A1)';
        } else {
          pinCodeError = null;
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  Images.logodark,
                  width: Dimensions.widthMQ * 0.35,
                  height: Dimensions.widthMQ * 0.25,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Sign Up',
                style: TextStyles.styleELBB.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 5),
              Text(
                'Create a Free account to Save Smart',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    LoginWidgets.nameTextField(nameController, nameError),
                    const SizedBox(height: 20),
                    // Email
                    LoginWidgets.emailTextField(emailController, emailError),
                    const SizedBox(height: 20),
                    // Phone
                    LoginWidgets.phoneTextField(phoneController, phoneError),
                    const SizedBox(height: 20),
                    // Pin Code
                    LoginWidgets.pinCodeTextField(
                        pinCodeController, pinCodeError),
                    const SizedBox(height: 20),
                    // Password
                    PasswordTextField(
                        controller: passwordController,
                        errorText: passwordError),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Terms and Conditions
              Row(
                children: [
                  Checkbox(
                    value: isAgreed,
                    activeColor: CustomColors.green,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'By signing up I agree with ',
                        style: TextStyles.styleMGrey.copyWith(fontSize: 12),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyles.styleMB.copyWith(
                              fontSize: 12,
                              color: CustomColors.green,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyles.styleMB.copyWith(
                              fontSize: 12,
                              color: CustomColors.green,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Sign Up Button
              Center(
                child: CustomWidgets.customButton('Continue', () {
                  validateName(nameController.text);
                  validateEmail(emailController.text);
                  validatePhone(phoneController.text);
                  validatePinCode(pinCodeController.text);
                  validatePassword(passwordController.text);

                  if (nameError == null &&
                      emailError == null &&
                      phoneError == null &&
                      pinCodeError == null &&
                      passwordError == null) {
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
                        const SnackBar(
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
                      MaterialPageRoute(builder: (context) => const SignIn()),
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
    );
  }
}
