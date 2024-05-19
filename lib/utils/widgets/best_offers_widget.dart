import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomBestOffers extends StatelessWidget {
  const CustomBestOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Best Offers',
              style: defaultTextStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: Color(0xFF40484E),
                // color: AppColors.mainTextGreyColor,
              ),
            ),
            8.width(),
            Container(
              width: 36.w,
              height: 36.h,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                  color: AppColors.mainTextColorWhite,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFFBE9E),
                      blurRadius: 10,
                    )
                  ]),
              child: Image.asset(
                Assets.iconFire,
              ),
            )
          ],
        ),
        ZoomTapAnimation(
          child: Row(
            children: [
              Text(
                'See all',
                style: defaultTextStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGreen,
                ),
              ),
              4.width(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13.sp,
                color: AppColors.darkGreen,
              )
            ],
          ),
        )
      ],
    );
  }
}
