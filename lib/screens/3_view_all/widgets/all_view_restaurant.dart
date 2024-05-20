import 'package:arestro_app/models/restaurants_data.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:arestro_app/utils/widgets/bottom_navigation_bar.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:arestro_app/utils/widgets/restaurant_info_row.dart';
import 'package:arestro_app/utils/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllViewRestaurant extends StatelessWidget {
  const AllViewRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,

      /// appbar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isSelected: false),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          23.height(),

          /// search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: const CustomSearchBar(isSearchable: false),
          ),
          24.height(),

          /// Popular Restaurants text
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: Text(
              'Popular Restaurants',
              style: defaultTextStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                color: const Color(0xFF40484E),
              ),
            ),
          ),
          20.height(),

          /// restaurants info row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i< restaurantDataList.length; i++)
                  CustomRestaurantInfo(
                    restaurantImagePath: restaurantDataList[i].restaurantImagePath,
                    restaurantName: restaurantDataList[i].restaurantName,
                    restaurantRating: restaurantDataList[i].restaurantRating,
                    isSelected: false,
                    index: i,
                  ),
              ],
            ),
          ),

          /// Restaurants nearby text
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: Text(
              'Restaurants Nearby',
              style: defaultTextStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                color: const Color(0xFF40484E),
              ),
            ),
          ),
          20.height(),

          for (int i = 0; i< restaurantDataList.length; i++)
            CustomRestaurantInfo(
              restaurantImagePath: restaurantDataList[i].restaurantImagePath,
              restaurantName: restaurantDataList[i].restaurantName,
              restaurantRating: restaurantDataList[i].restaurantRating,
              isSelected: true,
              index: i,
            ),
        ],
      ),
      bottomNavigationBar: CustomTabBox(),
    );
  }
}
