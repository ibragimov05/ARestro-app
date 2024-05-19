import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/food_data.dart';
import 'package:arestro_app/screens/3_view_all/widgets/view_all_row_creator.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatefulWidget {
  final bool isSearchable;

  const CustomSearchBar({super.key, required this.isSearchable});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  List<FoodData> filteredFoodList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: widget.isSearchable
              ? (value) {
                  // for (int i = 0; i < foodDataList.length; i++) {
                  //   if (foodDataList.contains(value)) {
                  //     setState(() {
                  //       CustomFoodRow(
                  //         foodImage: foodDataList[i].foodImage,
                  //         foodName: foodDataList[i].foodName,
                  //         foodPrice: foodDataList[i].foodPrice,
                  //         index: i,
                  //       );
                  //     });
                  //   }
                  // }
                  setState(() {
                    filteredFoodList = foodDataList.where((food) {
                      return food.foodName
                          .toLowerCase()
                          .contains(value.toLowerCase());
                    }).toList();
                  });
                  print(value);
                }
              : null,
          cursorColor: AppColors.customSearchBarBorder,
          textAlign: TextAlign.justify,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 30),
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
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 14.w,
              ),
              // Adjust the padding as needed
              child: SvgPicture.asset(
                Assets.iconSearch,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 45,
              minHeight: 45,
            ),
            hintText: 'Search for food, restaurants...',
            hintStyle: defaultTextStyle.copyWith(
              color: Color(0xFF000000).withOpacity(0.38),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 10.w, top: 5.h, bottom: 5.h),
              child: SvgPicture.asset(Assets.iconKeyboardVoice),
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 30,
              minHeight: 30,
            ),
          ),
        ),
        if (widget.isSearchable)
          Container(
            height: adderToHeight(270).h,
            // color: Colors.yellow,
            child: Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredFoodList.length,
                itemBuilder: (context, index) {
                  final food = filteredFoodList[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: CustomFoodRow(
                      foodImage: food.foodImage,
                      foodName: food.foodName,
                      foodPrice: food.foodPrice,
                      index: index,
                      isSearch: true,
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  int adderToHeight(int oldNumber){
    return oldNumber + 300;
  }
}
