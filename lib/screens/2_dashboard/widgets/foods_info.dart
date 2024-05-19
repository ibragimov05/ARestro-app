import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomFoodInfo extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodPrice;

  const CustomFoodInfo({
    super.key,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {},
      child: Container(
        width: 120.w,
        height: 240.h,
        margin: EdgeInsets.only(left: 16.w, right: 5.w),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 10,
              child: Container(
                width: 102.w,
                height: 180.h,
                margin: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  border: Border.all(
                    color: Color(0xFF009944).withOpacity(0.1),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      foodName,
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    11.height(),
                    Text(
                      'Some Details',
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: AppColors.mainTextGreyColor,
                      ),
                    ),
                    12.height(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'RS',
                          style: defaultTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 10.sp,
                            color: Color(0xFF777777),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        5.width(),
                        Text(
                          foodPrice,
                          style: defaultTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              color: AppColors.mainGreenColor),
                        ),
                      ],
                    ),
                    10.height(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              // alignment: ,
              child: Container(
                width: 124.w,
                height: 124.h,
                child: Image.asset(
                  foodImage,
                  height: 97.h,
                  width: 90.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
