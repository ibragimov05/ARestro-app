import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/cart_data.dart';
import 'package:arestro_app/models/user_data.dart';
import 'package:arestro_app/screens/5_food_order/food_order_food_details.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomFoodRow extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodPrice;
  final int index;
  final bool isSearch;

  CustomFoodRow({
    super.key,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    required this.index,
    required this.isSearch,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return FoodOrderDetailsPage(
                foodImage: foodImage,
                foodName: foodName,
                foodPrice: foodPrice,
                isBestOffers: false,
              );
            },
          ),
        );
      },
      child: Container(
        width: isSearch ? double.infinity : 151.w,
        clipBehavior: Clip.hardEdge,
        margin: isSearch
            ? EdgeInsets.only(bottom: 0.h, top: 20.h)
            : EdgeInsets.only(left: index == 0 ? 30.w : 11.w, right: 11),
        decoration: BoxDecoration(
          color: isSearch ? AppColors.appBackgroundColor : Color(0xFFFFFFFF),
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment:
              isSearch ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Image.asset(
              foodImage,
              width: 151.w,
              height: isSearch ? 150.h : 132.h,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            11.height(),
            Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                bottom: 24.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: AppColors.textColorBlack,
                    ),
                  ),
                  11.height(),
                  SizedBox(
                    width: 110.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs. $foodPrice',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Color(0xFF000000).withOpacity(0.5),
                          ),
                        ),
                        // 10.width(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}