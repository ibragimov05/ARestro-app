import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomTabBox extends StatelessWidget {
  CustomTabBox({super.key});

  List<Map<String, dynamic>> tabBoxButtonData = [
    {
      'iconPath': Assets.iconTabBoxHome,
      'iconName': 'Home',
      'isSelected': true,
    },
    {
      'iconPath': Assets.iconTabBoxSearch,
      'iconName': 'Search',
      'isSelected': false,
    },
    {
      'iconPath': Assets.iconTabBoxCart,
      'iconName': 'Cart',
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      padding: EdgeInsets.only(left: 45.w, right: 45.w, top: 15.h),
      color: AppColors.mainTextColorWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var each in tabBoxButtonData)
            customButtonMaker(
              iconPath: each['iconPath'],
              iconName: each['iconName'],
              isSelected: each['isSelected'],
            ),
        ],
      ),
    );
  }

  Widget customButtonMaker({
    required String iconPath,
    required String iconName,
    required bool isSelected,
  }) {
    return ZoomTapAnimation(
      onTap: () {},
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? null : const Color(0xFF808080),
          ),
          3.height(),
          Text(
            iconName,
            style: defaultTextStyle.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
              color: isSelected
                  ? AppColors.darkGreen
                  : const Color(0xFF000000).withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
