import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealmart_customer/constants/custom_widgets.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/textstyles.dart';
import 'package:idealmart_customer/features/login/presentation/controllers/sign_up_controller.dart';
import 'package:idealmart_customer/features/login/presentation/pages/sign_in.dart';
 class SignUp extends StatelessWidget {
   const SignUp({super.key});

   @override
   Widget build(BuildContext context) {
     final SignUpController controller = Get.put(SignUpController());
     return Scaffold(
         backgroundColor: CustomColors.white,
         appBar: AppBar(
           backgroundColor: CustomColors.white,
           leading: Container(
               margin: const EdgeInsets.only(left: 10),
               decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   border: Border.all(color: CustomColors.green)),
               child: IconButton(
                   icon: const Icon(Icons.arrow_back_ios_new_rounded),
                   onPressed: () {})),
         ),
         body: Center(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             child: SingleChildScrollView(
               child: Column(children: [
                 Container(
                   margin: const EdgeInsets.only(bottom: 25),
                   decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       border: Border.all(color: CustomColors.green)),
                   child: Image.asset(
                     Images.bg3,
                     height: 250,
                     width: 250,
                   ),
                 ),
                 Container(
                     margin: const EdgeInsets.only(bottom: 4, top: 8),
                     alignment: Alignment.centerLeft,
                     child: Text('Name', style: TextStyles.styleLB)),
                 TextField(
                   style: TextStyles.styleLB,
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: CustomColors.faintWhite,
                     enabledBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.transparent),
                         borderRadius: BorderRadius.circular(6)),
                     focusedBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.transparent),
                         borderRadius: BorderRadius.circular(6)),
                   ),
                 ),
                 Container(
                     margin: const EdgeInsets.only(bottom: 4, top: 8),
                     alignment: Alignment.centerLeft,
                     child: Text('Email or Phone', style: TextStyles.styleLB)),
                 TextField(
                   style: TextStyles.styleLB,
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: CustomColors.faintWhite,
                     enabledBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.transparent),
                         borderRadius: BorderRadius.circular(6)),
                     focusedBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.transparent),
                         borderRadius: BorderRadius.circular(6)),
                   ),
                 ),
                 Container(
                   margin: const EdgeInsets.only(bottom: 4, top: 8),
                   child: Container(
                       alignment: Alignment.centerLeft,
                       child: Text(
                         'Password',
                         style: TextStyles.styleLB,
                       )),
                 ),
                 Obx(()=> TextField(
                   style: TextStyles.styleLB,
                   obscureText: !controller.isPasswordVisible.value,
                   obscuringCharacter: '*',
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: CustomColors.faintWhite,
                     suffixIcon: IconButton(
                       icon: Icon(
                           controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off),
                       onPressed:controller.togglePasswordVisibility,
                     ),
                     enabledBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.transparent),
                         borderRadius: BorderRadius.circular(4)),
                     focusedBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color: Colors.transparent),
                         borderRadius: BorderRadius.circular(4)),
                   ),
                 )),

                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 35),
                   child: CustomWidgets.customButton('Sign up', (){}),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 25.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text(
                         "Already have an account? ",
                         style: TextStyles.styleLB,
                       ),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
                         },
                         child: Text("Sign in",
                             style: TextStyle(
                                 decoration: TextDecoration.underline,
                                 decorationColor: CustomColors.green,
                                 color: CustomColors.green,
                                 fontFamily: Fonts.poppins,
                                 fontSize: Dimensions.largeTextSize)),
                       ),
                     ],
                   ),
                 )
               ]),
             ),
           ),
         ));
   }
 }

