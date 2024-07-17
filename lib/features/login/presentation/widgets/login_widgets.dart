import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
import 'package:iconsax/iconsax.dart';

class LoginWidgets {
  static Widget emailTextField(
      TextEditingController controller, String? errorText) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        prefixIcon: Icon(FluentIcons.mail_16_regular,
            color: CustomColors.grey.withOpacity(0.5)),
        hintText: 'Enter your email',
        hintStyle: TextStyles.styleMGrey,
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onChanged: (value) {
        // No need to add logic here, it will be handled in the parent widget
      },
    );
  }

  static Widget nameTextField(
      TextEditingController controller, String? errorText) {
    return TextFormField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_rounded,
            color: CustomColors.grey.withOpacity(0.5)),
        hintText: 'Enter your full name',
        hintStyle: TextStyles.styleMGrey,
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onChanged: (value) {
        // No need to add logic here, it will be handled in the parent widget
      },
    );
  }

  static Widget phoneTextField(
      TextEditingController controller, String? errorText) {
    return TextFormField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        prefixIcon: Icon(FluentIcons.phone_16_regular,
            color: CustomColors.grey.withOpacity(0.5)),
        hintText: 'Enter your phone number',
        hintStyle: TextStyles.styleMGrey,
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onChanged: (value) {
        // No need to add logic here, it will be handled in the parent widget
      },
    );
  }

  static Widget pinCodeTextField(
      TextEditingController controller, String? errorText) {
    return TextFormField(
      controller: controller,
      style: TextStyles.styleMB,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.pin_drop_outlined,
            color: CustomColors.grey.withOpacity(0.5)),
        hintText: 'Enter your pin code',
        hintStyle: TextStyles.styleMGrey,
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onChanged: (value) {
        // No need to add logic here, it will be handled in the parent widget
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
  const PasswordTextField(
      {super.key, required this.controller, this.errorText});

  final TextEditingController controller;
  final String? errorText;

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
        prefixIcon:
            Icon(Iconsax.lock, color: CustomColors.grey.withOpacity(0.5)),
        hintText: 'Enter your password',
        hintStyle: TextStyles.styleMGrey,
        errorText: widget.errorText,
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(6),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      onChanged: (value) {
        // No need to add logic here, it will be handled in the parent widget
      },
    );
  }
}
