import 'package:arestro_app/models/burger_food_data.dart';
import 'package:arestro_app/models/momo_food_data.dart';
import 'package:arestro_app/models/pizza_food_data.dart';
import 'package:arestro_app/screens/3_view_all/widgets/view_all_row_creator.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:arestro_app/utils/widgets/bottom_navigation_bar.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:arestro_app/utils/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllViewFoodPage extends StatelessWidget {
  const AllViewFoodPage({super.key});

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
          23.height(),

          /// search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: const CustomSearchBar(isSearchable: false),
          ),
          15.height(),

          /// momo text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 47.w),
            child: Text(
              'Mo:mo',
              style: defaultTextStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 26.sp,
                color: const Color(0xFF40484E),
              ),
            ),
          ),
          11.height(),

          /// momo food row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < momoFoodDataList.length; i++)
                  CustomFoodRow(
                    foodImage: momoFoodDataList[i].foodImage,
                    foodName: momoFoodDataList[i].foodName,
                    foodPrice: momoFoodDataList[i].foodPrice,
                    index: i,
                    isSearch: false,
                  ),
              ],
            ),
          ),
          11.height(),

          /// pizza text
          Padding(
            padding: EdgeInsets.only(left: 47.w),
            child: Text(
              'Pizza',
              style: defaultTextStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 26.sp,
                color: const Color(0xFF40484E),
              ),
            ),
          ),
          11.height(),

          /// pizza food row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < pizzaFoodDataList.length; i++)
                  CustomFoodRow(
                    foodImage: pizzaFoodDataList[i].foodImage,
                    foodName: pizzaFoodDataList[i].foodName,
                    foodPrice: pizzaFoodDataList[i].foodPrice,
                    index: i,
                    isSearch: false,
                  ),
              ],
            ),
          ),
          11.height(),

          /// burger text
          Padding(
            padding: EdgeInsets.only(left: 47.w),
            child: Text(
              'Burger',
              style: defaultTextStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 26.sp,
                color: const Color(0xFF40484E),
              ),
            ),
          ),
          11.height(),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < burgerFoodDataList.length; i++)
                  CustomFoodRow(
                    foodImage: burgerFoodDataList[i].foodImage,
                    foodName: burgerFoodDataList[i].foodName,
                    foodPrice: burgerFoodDataList[i].foodPrice,
                    index: i,
                    isSearch: false,
                  ),
              ],
            ),
          ),
          15.height(),
        ],
      ),
      bottomNavigationBar: CustomTabBox(),
    );
  }
}
