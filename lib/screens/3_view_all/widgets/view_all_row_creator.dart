import 'package:arestro_app/screens/5_food_order/food_order_food_details.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomFoodRow extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodPrice;
  final int index;
  final bool isSearch;

  const CustomFoodRow({
    super.key,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    required this.index,
    required this.isSearch,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return FoodOrderDetailsPage(
                foodImage: foodImage,
                foodName: foodName,
                foodPrice: foodPrice,
                isBestOffers: false,
              );
            },
          ),
        );
      },
      child: Container(
        width: 151.w,
        clipBehavior: Clip.hardEdge,
        padding: isSearch ? EdgeInsets.all(5.sp) : null,
        margin: isSearch
            ? EdgeInsets.only(left: 8.sp, right: 8.sp, top: 10.h)
            : EdgeInsets.only(left: index == 0 ? 30.w : 11.w, right: 11),
        decoration: BoxDecoration(
          color: isSearch ? AppColors.appBackgroundColor : const Color(0xFFFFFFFF),
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: isSearch
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    foodImage,
                    width: 100.w,
                    height: 90.h,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  11.width(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.w,
                      bottom: 24.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        20.height(),
                        Text(
                          foodName,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.textColorBlack,
                          ),
                        ),
                        11.height(),
                        Text(
                          'Rs. $foodPrice',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: const Color(0xFF000000).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    foodImage,
                    width: 151.w,
                    height: 132.h,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  11.height(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.w,
                      bottom: 24.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodName,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.textColorBlack,
                          ),
                        ),
                        11.height(),
                        SizedBox(
                          width: 110.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rs. $foodPrice',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0xFF000000).withOpacity(0.5),
                                ),
                              ),
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
}
