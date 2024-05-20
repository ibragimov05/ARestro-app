import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

/// widget for button
class OnboardingGreenButton extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final bool isIconSelected;
  final Function() onPressed;

  const OnboardingGreenButton({
    super.key,
    required this.buttonText,
    required this.isSelected,
    required this.isIconSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainGreenColor : Colors.white,
          border: Border.all(
            color: isSelected
                ? AppColors.mainGreenColor
                : AppColors.mainTextGreyColor,
          ),
          borderRadius: BorderRadius.circular(5.r),
        ),

        /// if isIconSelected == true button should contain google icon
        child: isIconSelected
            ? Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    Image.asset(Assets.iconGoogle, height: 26.h, width: 26.w),
                    43.width(),
                    Text(
                      buttonText,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: const Color(0xFF000000).withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              )

            /// otherwise it should not
            : Center(
                child: Text(
                  buttonText,
                  style: defaultTextStyle.copyWith(
                    fontSize: 16.sp,
                    color:
                        isSelected ? Colors.white : AppColors.mainTextGreyColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}
