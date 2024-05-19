import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/food_data.dart';
import 'package:arestro_app/models/restaurants_data.dart';
import 'package:arestro_app/screens/2_dashboard/widgets/foods_info.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:arestro_app/utils/widgets/best_offers_widget.dart';
import 'package:arestro_app/utils/widgets/bottom_navigation_bar.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:arestro_app/utils/widgets/restaurant_info_row.dart';
import 'package:arestro_app/utils/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // List<Map<String, dynamic>> foodDataList = [
  //   {'foodImage': Assets.imageFood1, 'foodName': 'Food 1', 'foodPrice': '310'},
  //   {'foodImage': Assets.imageFood2, 'foodName': 'Food 2', 'foodPrice': '285'},
  //   {'foodImage': Assets.imageFood3, 'foodName': 'Food 3', 'foodPrice': '300'},
  // ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [d
          24.height(),

          /// main container in top with special offer
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.infinity,
              // height: 150.h,
              padding: EdgeInsets.only(top: 17.h, left: 21.w, bottom: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  alignment: Alignment.bottomRight,
                  image: AssetImage(Assets.imageThreeBurger),
                ),
                gradient: LinearGradient(colors: [
                  Color(0xFF0e502f),
                  Color(0xFF8dbda5),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 137.w,
                    // height: 75.h,
                    child: Text(
                      'Special Offer for March',
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: AppColors.mainTextColorWhite,
                      ),
                    ),
                  ),
                  11.height(),
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      'We are here with the Best Burgers in town.',
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: AppColors.mainTextColorWhite,
                      ),
                    ),
                  ),
                  13.height(),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.h, vertical: 8.5.w),
                      decoration: BoxDecoration(
                        color: AppColors.mainTextColorWhite,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        'Buy Now',
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 12.sp,
                          color: AppColors.darkGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          16.height(),

          /// search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CustomSearchBar(),
          ),
          18.height(),

          /// best offers row
          Padding(
            padding: EdgeInsets.only(left: 38.w, right: 31.w),
            child: CustomBestOffers(),
          ),
          16.height(),

          /// foods info single child scroll view
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var each in foodDataList)
                  CustomFoodInfo(
                    foodImage: each.foodImage,
                    foodName: each.foodName,
                    foodPrice: each.foodPrice,
                  ),
              ],
            ),
          ),
          44.height(),

          /// see all restaurants button
          Padding(
            padding: EdgeInsets.only(left: 32.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Restaurants Nearby',
                  style: defaultTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    color: Color(0xFF40484E),
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'See all',
                        style: defaultTextStyle.copyWith(
                            fontSize: 12.sp, color: Color(0xFF00CC55)),
                      ),
                      4.width(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15.sp,
                        color: Color(0xFF00CC55),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          16.height(),

          /// see all restaurants row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var each in restaurantDataList)
                  CustomRestaurantInfo(
                    restaurantImagePath: each.restaurantImagePath,
                    restaurantName: each.restaurantName,
                    restaurantRating: each.restaurantRating,
                  ),
              ],
            ),
          ),
          // 30.height(),
        ],
      ),

      /// custom bottom navigation bar
      bottomNavigationBar: CustomTabBox(),
    );
  }
}
