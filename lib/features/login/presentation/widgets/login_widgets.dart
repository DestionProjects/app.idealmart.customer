// lib/features/login/presentation/widgets/login_widgets.dart

import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';

class LoginWidgets {
  static Widget emailTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  static Widget nameTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        hintText: 'Enter your full name',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  static Widget phoneTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        hintText: 'Enter your phone number',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  static Widget pinCodeTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        hintText: 'Enter your pin code',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  static Widget textAndTextButton(String text, String textButton,
      VoidCallback onTap, TextStyle textStyle, double textButtonSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          style: textStyle,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textButton,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: CustomColors.green,
              color: CustomColors.green,
              fontFamily: Fonts.poppins,
              fontSize: textButtonSize,
            ),
          ),
        ),
      ],
    );
  }

  static Widget loginText(String text) {
    return Text(text, style: TextStyles.styleMB);
  }

  static Widget headerText(String text) {
    return Text(text, style: TextStyles.styleELBB);
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.styleMB,
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: 'Enter your password',
        filled: true,
        fillColor: CustomColors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }
}
