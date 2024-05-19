import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/cart_data.dart';
import 'package:arestro_app/screens/2_dashboard/dashboard.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:arestro_app/utils/widgets/custom_floating_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FoodOrderDetailsPage extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodPrice;
  final bool isBestOffers;

  const FoodOrderDetailsPage({
    super.key,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    required this.isBestOffers,
  });

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
        children: [
          /// food image
          SizedBox(
            width: double.infinity,
            height: isBestOffers ? 395.h : 300.h,
            child: Image.asset(
              foodImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            // color: Colors.yellow,
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                38.height(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.darkGreen,
                      ),
                    ),
                  ],
                ),
                19.height(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 17.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.darkGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7.5.sp),
                      ),
                      child: Text(
                        'Popular',
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: AppColors.darkGreen,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.darkGreen.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(Assets.imageLocation),
                        ),
                        12.width(),
                        Container(
                          width: 35.w,
                          height: 35.h,
                          // padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.textColorBlack.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.favorite,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                20.height(),
                Text(
                  foodName,
                  style: defaultTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 28.sp,
                    color: Color(0xFF09051C),
                  ),
                ),
                17.height(),
                Padding(
                  padding: EdgeInsets.only(right: 80.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.iconStar),
                          10.width(),
                          Text(
                            '4.8 Rating',
                            style: defaultTextStyle.copyWith(
                              color: Color(0xFF989898),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.iconCart),
                          7.width(),
                          Text(
                            '2000+ Order',
                            style: defaultTextStyle.copyWith(
                              color: Color(0xFF989898),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                15.height(),

                /// food description
                Text(
                  'Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum.',
                  style: defaultTextStyle.copyWith(
                    color: AppColors.textColorBlack,
                  ),
                ),
                20.height(),

                /// foood ingredient
                rowMaker(text: 'Ingredient 1'),
                rowMaker(text: 'Ingredient 2'),
                rowMaker(text: 'Ingredient 3'),
                rowMaker(text: 'Ingredient 4'),
              ],
            ),
          ),
          80.height(),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        buttonText: 'Add to Cart',
        onTap: () {
          bool isInCart = false;

          /// checking whether user added product previously
          for (int i = 0; i < userCartList.length; i++) {
            if (foodName == userCartList[i].foodName) {
              isInCart = true;
              break;
            }
          }

          /// if product not in cart adding it to cart
          if (!isInCart) {
            userCartList.add(
              UserCart(
                foodImage: foodImage,
                foodName: foodName,
                foodPrice: foodPrice,
              ),
            );
          }
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) {
                return DashboardPage();
              },
            ),
          );
          /// showing dialog to user
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  !isInCart ? 'Item Added' : 'Cannot  add item',
                  style: defaultTextStyle.copyWith(
                      color: AppColors.darkGreen,
                      fontWeight: FontWeight.w800,
                      fontSize: 25.sp),
                ),
                content: Text(
                  !isInCart
                      ? '$foodName has been added to your cart.'
                      : '$foodName already in your cart',
                  style: defaultTextStyle.copyWith(
                    color: AppColors.darkGreen.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                actions: <Widget>[
                  /// go to home page
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          color: AppColors.greenColorBestOffers,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Text(
                        'OK',
                        style: defaultTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget rowMaker({required String text}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 5.sp,
          ),
          5.width(),
          Text(
            text,
            style: defaultTextStyle.copyWith(color: AppColors.textColorBlack),
          ),
        ],
      ),
    );
  }
}
