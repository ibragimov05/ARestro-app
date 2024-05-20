import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatRowMakerText extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isSelected;

  const CustomFloatRowMakerText({
    super.key,
    required this.text1,
    required this.text2,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isSelected
          ? EdgeInsets.only(top: 16.h)
          : EdgeInsets.only(bottom: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: defaultTextStyle.copyWith(
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              fontSize: isSelected ? 19.sp : 14.5.sp,
              color: const Color(0xFFFEFEFF),
            ),
          ),
          Text(
            text2,
            style: defaultTextStyle.copyWith(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              fontSize: isSelected ? 19.sp : 14.5.sp,
            ),
          ),
        ],
      ),
    );
  }
}
