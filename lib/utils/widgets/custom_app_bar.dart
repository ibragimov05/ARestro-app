import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: SizedBox(
        width: double.infinity,
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// drawer icon
            ZoomTapAnimation(
              onTap: () {},
              child: SvgPicture.asset(Assets.iconAppBar),
            ),

            /// main logo and text
            Row(
              children: [
                SvgPicture.asset(
                  Assets.imageMainLogo,
                  height: 31.h,
                  width: 31.w,
                ),
                5.width(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Ar',
                        style: poppinsTextStyple.copyWith(
                          color: AppColors.mainGreenColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 21.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'estro',
                        style: poppinsTextStyple.copyWith(
                          color: Color(0xFF004422),
                          fontWeight: FontWeight.w600,
                          fontSize: 21.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// user photo
            Container(
              height: 35.h,
              width: 35.w,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF3f657c),
                  Color(0xFF8f2b34),
                ]),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                Assets.imageProfilePhoto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
