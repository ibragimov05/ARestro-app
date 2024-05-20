import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/tab_bar_model.dart';
import 'package:arestro_app/screens/2_dashboard/dashboard.dart';
import 'package:arestro_app/screens/5_food_order/cart_page.dart';
import 'package:arestro_app/screens/7_search_page/search_page.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomTabBox extends StatefulWidget {
  const CustomTabBox({super.key});

  @override
  State<CustomTabBox> createState() => _CustomTabBoxState();
}

class _CustomTabBoxState extends State<CustomTabBox> {
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      padding: EdgeInsets.only(left: 45.w, right: 45.w, top: 15.h),
      color: tabBoxData[1].isTrue
          ? AppColors.appBackgroundColor
          : AppColors.mainTextColorWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customButtonMaker(
            iconPath: tabBoxButtonData[0]['iconPath'],
            iconName: tabBoxButtonData[0]['iconName'],
            isSelected: tabBoxData[0].isTrue,
            onTap: () {
              setState(() {
                tabBoxData[0].isTrue = true;
                tabBoxData[1].isTrue = false;
              });

              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return DashboardPage();
                  },
                ),
              );
            },
          ),
          customButtonMaker(
            iconPath: tabBoxButtonData[1]['iconPath'],
            iconName: tabBoxButtonData[1]['iconName'],
            isSelected: tabBoxData[1].isTrue,
            onTap: () {
              setState(() {
                tabBoxData[0].isTrue = false;
                tabBoxData[1].isTrue = true;
              });

              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
          ),
          customButtonMaker(
            iconPath: tabBoxButtonData[2]['iconPath'],
            iconName: tabBoxButtonData[2]['iconName'],
            isSelected: false,
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return const CartPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget customButtonMaker({
    required String iconPath,
    required String iconName,
    required bool isSelected,
    required Function() onTap,
  }) {
    return ZoomTapAnimation(
      onTap: onTap,
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
