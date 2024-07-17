import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/congratulation_page.dart';
import 'package:idealmart_customer/features/login/presentation/widgets/login_widgets.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.white,
        elevation: 0,
        title: LoginWidgets.headerText('Forget Password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 35),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.green),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/padlock.png", // Replace with your image URL or asset
                      width: Dimensions.widthMQ * 0.4,
                      height: Dimensions.widthMQ * 0.4,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  'Enter your email to recover your password',
                  style: TextStyles.styleLB,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  style: TextStyles.styleMB,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline,
                        color: CustomColors.grey.withOpacity(0.5)),
                    hintText: 'Enter your email',
                    hintStyle: TextStyles.styleMGrey,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColors.red),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: CustomColors.red),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                    if (!emailPattern.hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
                CustomWidgets.customButton('Submit', () {
                  if (_formKey.currentState?.validate() == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CongratulationPage(
                          text: 'Your password has been changed successfully',
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
