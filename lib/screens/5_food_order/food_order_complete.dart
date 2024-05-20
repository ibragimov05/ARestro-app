import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/screens/2_dashboard/dashboard.dart';
import 'package:arestro_app/screens/5_food_order/widgets/star_putter.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FoodOrderCompletePage extends StatelessWidget {
  const FoodOrderCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          /// backgroung
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(
              Assets.imageBackground,
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 130.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0.w),
              child: Column(
                children: [
                  /// main checkbox in center
                  Container(
                    height: 85.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        color: Color(0xFF009944),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF40BFFF).withOpacity(0.24),
                            blurRadius: 31.r,
                          )
                        ]),
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 40.sp,
                      // weight: 50.w,
                    ),
                  ),
                  20.height(),

                  /// thank you order completed text
                  Text(
                    'Thank You!\nOrder Completed',
                    textAlign: TextAlign.center,
                    style: defaultTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 26.sp,
                      color: AppColors.darkGreen,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  /// 5 star putter
                  StarScreen(),
                  21.height(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        /// feedback leave text field
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 1.w),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                'assets/icons/food_order_icons/edit_icon.svg',
                                height: 25.h,
                                width: 25.w,
                              ),
                            ),
                            hintText: 'Leave feedback',
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
                          ),
                        ),
                        22.height(),

                        /// two buttons in bottom
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customBottomButtonMaker(
                              buttonText: 'Submit',
                              isSelected: false,
                              context: context,
                            ),
                            customBottomButtonMaker(
                              buttonText: 'Skip',
                              isSelected: true,
                              context: context,
                            ),
                          ],
                        )
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

  Widget customBottomButtonMaker(
      {required String buttonText,
      required bool isSelected,
      required BuildContext context}) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pushAndRemoveUntil(context,
            CupertinoPageRoute(builder: (context) {
          return DashboardPage();
        }), (route) => false);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30.h),
        width: isSelected ? 85.w : 242.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: isSelected ? AppColors.appBackgroundColor : Color(0xFF009944),
          border: isSelected ? Border.all(color: Color(0xFF004422)) : null,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: defaultTextStyle.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 15.sp,
              color: isSelected ? AppColors.darkGreen : Color(0xFFFEFEFF),
            ),
          ),
        ),
      ),
    );
  }
}
