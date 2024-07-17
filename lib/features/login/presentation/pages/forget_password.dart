import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:idealmart_customer/features/login/presentation/pages/congratulation_page.dart';
import 'package:idealmart_customer/features/login/presentation/widgets/login_widgets.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(titleSpacing: 0,backgroundColor: CustomColors.white,title:  LoginWidgets.headerText('Forget Password')),
        body: Stack(

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                          children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Text(
                            'Enter your email to recover your password',style: TextStyles.styleLB,
                          ),
                        ),
                        LoginWidgets.emailTextField(emailController),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35),
                          child: CustomWidgets.customButton('Submit', () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CongratulationPage(text: 'Your new password has been set. You can login to your account')));
                          }),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
