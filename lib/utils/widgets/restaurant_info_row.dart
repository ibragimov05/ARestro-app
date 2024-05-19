import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/screens/4_restaurant_details/restaurant_details.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomRestaurantInfo extends StatelessWidget {
  final String restaurantImagePath;
  final String restaurantName;
  final String restaurantRating;
  final bool isSelected;
  final int index;

  const CustomRestaurantInfo({
    super.key,
    required this.restaurantImagePath,
    required this.restaurantName,
    required this.restaurantRating,
    required this.isSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return RestaurantDetails(index: index);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 5.w, bottom: 15.h),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r))
            : null,
        child: Column(
          children: [
            /// restaurant photo
            Container(
              width: isSelected ? double.infinity : 155.w,
              height: isSelected ? 161.h : 93.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    restaurantImagePath,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(isSelected ? 0.r : 12.r),
                  bottomRight: Radius.circular(isSelected ? 0.r : 12.r),
                ),
              ),
            ),
            12.height(),
            SizedBox(
              width: isSelected ? double.infinity : 155.w,
              child: isSelected

                  /// for bit containers
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: 17.w, right: 17.w, bottom: 18.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurantName,
                                textAlign: TextAlign.center,
                                style: defaultTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                  color: Color(0xFF40484E),
                                ),
                              ),
                              5.height(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    Assets.iconStar,
                                    height: 18.h,
                                    width: 16.w,
                                  ),
                                  6.width(),
                                  Text(
                                    restaurantRating,
                                    textAlign: TextAlign.center,
                                    style: defaultTextStyle.copyWith(
                                      fontSize: 16.sp,
                                      color: Color(0xFF40484E),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 244.w,
                            child: Text(
                              'Restaurant Description Restaurant Description',
                              style: defaultTextStyle.copyWith(
                                color: Color(0xFF40484E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                  /// for little containers
                  : Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
