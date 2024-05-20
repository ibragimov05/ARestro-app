import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomFloatButton extends StatelessWidget {
  final String buttonText;
  final Function() onTapFunction;
  final bool isSelected;

  const CustomFloatButton({
    super.key,
    required this.buttonText,
    required this.onTapFunction,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTapFunction,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkGreen : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: defaultTextStyle.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 17.sp,
              color: isSelected ? AppColors.mainTextColorWhite : AppColors.darkGreen,
            ),
          ),
        ),
      ),
    );
  }
}
