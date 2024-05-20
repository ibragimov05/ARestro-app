import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/food_data.dart';
import 'package:arestro_app/models/restaurants_data.dart';
import 'package:arestro_app/screens/2_dashboard/dashboard.dart';
import 'package:arestro_app/screens/2_dashboard/widgets/foods_info.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:arestro_app/utils/widgets/best_offers_widget.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:arestro_app/utils/widgets/custom_floating_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class RestaurantDetails extends StatelessWidget {
  final int index;

  const RestaurantDetails({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isSelected: false),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            height: 240.h,
            child: Image.asset(
              restaurantDataList[index].restaurantImagePath,
              fit: BoxFit.cover,
            ),
          ),
          // Column(
          //   children: [],
          // )
          31.height(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// restaurant name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 225.w,
                      child: Text(
                        restaurantDataList[index].restaurantName,
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: AppColors.darkGreen,
                        ),
                      ),
                    ),
                    Image.asset(
                      Assets.imageFiveStar,
                      width: 88.w,
                      height: 16.h,
                    ),
                  ],
                ),
                3.height(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.imageLocation,
                          width: 11.w,
                          height: 14.h,
                        ),
                        11.width(),
                        Text(
                          '1.2 km from Location',
                          style: defaultTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: AppColors.textColorBlack.withOpacity(0.5)),
                        ),
                      ],
                    ),

                    /// view on google button
                    ZoomTapAnimation(
                      onTap: () {},
                      child: Text(
                        'View on Google Maps',
                        style: defaultTextStyle.copyWith(
                          fontSize: 12.sp,
                          color: Color(0xFF8B3C76),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF8B3C76),
                        ),
                      ),
                    ),
                  ],
                ),
                18.height(),

                /// description text
                Text(
                  'Description',
                  style: defaultTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: AppColors.textColorBlack.withOpacity(0.8),
                  ),
                ),
                5.height(),

                /// description
                Text(
                  restaurantDataList[index].restaurantDescription,
                  style: defaultTextStyle.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.textColorBlack.withOpacity(0.5),
                  ),
                ),
                20.height(),

                Text(
                  'Facilities',
                  style: defaultTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: AppColors.textColorBlack.withOpacity(0.8),
                  ),
                ),
                5.height(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        facilitiesCreator(text: 'Snack bar'),
                        facilitiesCreator(text: 'Bikes and Car Parking'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        facilitiesCreator(text: 'Toilet'),
                        facilitiesCreator(text: '24/7 Water facility'),
                      ],
                    )
                  ],
                ),

                /// custom best offers row
                18.height(),
                CustomBestOffers(),
              ],
            ),
          ),
          16.height(),

          /// foods row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // for (var each in foodDataList)
                for (int i = 0; i < foodDataList.length; i++)
                  CustomFoodInfo(
                    foodImage: foodDataList[i].foodImage,
                    foodName: foodDataList[i].foodName,
                    foodPrice: foodDataList[i].foodPrice,
                    index: i,
                    // isBestOffers: false,
                  ),
              ],
            ),
          ),
          70.height(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        buttonText: 'View Available Tables',
        onTap: () {
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
    );
  }

  Widget facilitiesCreator({required String text}) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imageTick, width: 8.w, height: 9.w),
        5.width(),
        Text(
          text,
          style: defaultTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: AppColors.textColorBlack.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
