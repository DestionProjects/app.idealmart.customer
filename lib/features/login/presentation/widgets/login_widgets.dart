// lib/features/login/presentation/widgets/login_widgets.dart

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';

class LoginWidgets {
  static Widget emailTextField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        prefixIcon: Icon(FluentIcons.mail_16_regular,color: CustomColors.grey.withOpacity(0.5),),
        hintText: 'Enter your email',
        hintStyle: TextStyles.styleMGrey,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        // Add more email validation logic if needed
        return null;
      },
    );
  }

  static Widget nameTextField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_rounded,color:CustomColors.grey.withOpacity(0.5)),
        hintStyle: TextStyles.styleMGrey,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Full Name';
        }
        // Add more name validation logic if needed
        return null;
      },
    );
  }

  static Widget phoneTextField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        prefixIcon: Icon(FluentIcons.phone_16_regular,color:CustomColors.grey.withOpacity(0.5)),
        hintStyle: TextStyles.styleMGrey,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        final canadaPhonePattern = RegExp(r'^\d{3}-\d{3}-\d{4}$');
        if (!canadaPhonePattern.hasMatch(value)) {
          return 'Enter a valid phone number (XXX-XXX-XXXX)';
        }
        return null;
      },
    );
  }

  static Widget pinCodeTextField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.pin_drop_outlined,color:CustomColors.grey.withOpacity(0.5)),
        hintStyle: TextStyles.styleMGrey,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your pincode';
        }
        final canadaPinCodePattern = RegExp(r'^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$');
        if (!canadaPinCodePattern.hasMatch(value)) {
          return 'Enter a valid pincode (A1A 1A1)';
        }
        return null;
      },
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
    return TextFormField(
      style: TextStyles.styleMB,
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline_rounded,color:CustomColors.grey.withOpacity(0.5)),
        hintStyle: TextStyles.styleMGrey,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        // Add more password validation logic if needed
        return null;
      },
    );
  }
}
