import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomRestaurantInfo extends StatelessWidget {
  final String restaurantImagePath;
  final String restaurantName;
  final String restaurantRating;

  const CustomRestaurantInfo({
    super.key,
    required this.restaurantImagePath,
    required this.restaurantName,
    required this.restaurantRating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 5.w, bottom: 15.h),
      child: ZoomTapAnimation(
        onTap: () {},
        child: Column(
          children: [
            Container(
              width: 155.w,
              height: 93.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      restaurantImagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(13.r)),
            ),
            12.height(),
            SizedBox(
              width: 155.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantName,
                    textAlign: TextAlign.start,
                    style: defaultTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5.sp,
                      color: Color(0xFF40484E),
                    ),
                  ),
                  5.height(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(Assets.iconStar),
                      6.width(),
                      Text(
                        restaurantRating,
                        style: defaultTextStyle.copyWith(
                          fontSize: 12.sp,
                          color: Color(0xFF40484E),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
