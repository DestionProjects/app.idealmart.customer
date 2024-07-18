import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:idealmart_customer/constants/dimensions.dart';
import 'package:idealmart_customer/constants/fonts_colors.dart';
import 'package:idealmart_customer/constants/images.dart';
import 'package:idealmart_customer/constants/text_styles.dart';
class HomeWidgets{
  static Widget productHeader(String headerText,VoidCallback onTap) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(headerText, style: TextStyles.styleELBB),
      Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: CustomColors.grey.withOpacity(0.3), shape: BoxShape.circle),
        child: GestureDetector(
            onTap: onTap,
            child: Icon(Icons.arrow_forward, color: CustomColors.white)),
      )
    ]);
  }

  static Widget productCard(
      String imagePath,
      String discount,
      String productName,
      String quantity,
      String discountProductPrice,
      String originalProductPrice,
      VoidCallback addToCart,
      VoidCallback onCardTap) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        width: Dimensions.widthMQ * 0.35,
        margin: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: CustomColors.grey.withOpacity(0.3)),
                        color: CustomColors.white),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          imagePath,
                          height: Dimensions.widthMQ * 0.35,
                          width: Dimensions.widthMQ * 0.35,
                          fit: BoxFit.cover,
                        )),
                  )),
              Align(
                  alignment: const Alignment(-0.8, 0),
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          color: CustomColors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        productCardTextStyle('$discount%', CustomColors.white,
                            Dimensions.xSmallTextSize * 0.8),
                        productCardTextStyle('OFF', CustomColors.white,
                            Dimensions.xSmallTextSize * 0.8),
                      ]))),
            ]),
            Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: Dimensions.widthMQ * 0.45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product name',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.styleSB),
                              productCardTextStyle(quantity, CustomColors.grey,
                                  Dimensions.xSmallTextSize)
                            ],
                          ),
                          // GestureDetector(
                          //     child: Icon(
                          //   Iconsax.add_circle,
                          //   color: CustomColors.green,
                          // )),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                productCardTextStyle(
                                    '\$ $discountProductPrice',
                                    CustomColors.blue,
                                    Dimensions.smallTextSize),
                                Text(
                                  '\$ $originalProductPrice',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: CustomColors.grey,
                                      decorationColor: CustomColors.grey,
                                      fontSize: Dimensions.xSmallTextSize,
                                      fontFamily: Fonts.poppins),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: addToCart,
                              child: const Icon(
                                Iconsax.add_circle,
                                color: CustomColors.green,
                              ),
                            )
                          ])
                    ]))
          ],
        ),
      ),
    );
  }

  static Widget productCardTextStyle(String text, Color color, double fontSize) {
    return Text(text,
        style: TextStyle(
            fontFamily: Fonts.poppins, color: color, fontSize: fontSize));
  }
  static Widget categoryHeader(String headerText,VoidCallback onTap){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(headerText, style: TextStyles.styleELBB),
      GestureDetector(
          onTap: onTap,
          child: Text('See all Categories',style: TextStyle(fontFamily: Fonts.poppins,fontSize: Dimensions.smallTextSize,color: CustomColors.green,decoration: TextDecoration.underline,decorationColor: CustomColors.green),))
    ]);
  }
  static Widget categoryCard(String text,VoidCallback onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 4,top: 4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: CustomColors.grey.withOpacity(0.095)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color: CustomColors.white),
              child: ClipOval(child: Image.asset(Images.bg3,height: 30,width: 30,)),
            ),
            SizedBox(width: 4,),
            Text(text,style: TextStyles.styleSB)
          ]
        ),
      ),
    );
  }
}

