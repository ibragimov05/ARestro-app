import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.customSearchBarBorder,
      textAlign: TextAlign.justify,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: AppColors.customSearchBarBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: AppColors.customSearchBarBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: AppColors.customSearchBarBorder,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 14.w,
          ),
          // Adjust the padding as needed
          child: SvgPicture.asset(
            Assets.iconSearch,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 45,
          minHeight: 45,
        ),
        hintText: 'Search for food, restaurants...',
        hintStyle: defaultTextStyle.copyWith(
          color: Color(0xFF000000).withOpacity(0.38),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10.w, top: 5.h, bottom: 5.h),
          child: SvgPicture.asset(Assets.iconKeyboardVoice),
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 30,
          minHeight: 30,
        ),
      ),
    );
  }
}
