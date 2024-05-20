import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;

  const CustomFloatingActionButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 38.w),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.mainGreenColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: defaultTextStyle.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
