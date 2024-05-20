import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/cart_data.dart';
import 'package:arestro_app/screens/2_dashboard/dashboard.dart';
import 'package:arestro_app/screens/5_food_order/food_order_complete.dart';
import 'package:arestro_app/screens/5_food_order/widgets/float_button_maker.dart';
import 'package:arestro_app/screens/5_food_order/widgets/float_row_maker.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _subTotal = 0;
  int _totalSum = 0;
  int _deliverySum = 0;
  int _discountSum = 0;
  double _discountChecker = 0;

  @override
  void initState() {
    // TODO: implement initState
    /// adding all prices of products to one variable
    if (userCartList.isNotEmpty) {
      for (int i = 0; i < userCartList.length; i++) {
        _subTotal += int.parse(userCartList[i].foodPrice);
        _deliverySum += 50;
        _totalSum += int.parse(userCartList[i].foodPrice) + _deliverySum;
      }
      // adding discount to subTotal
      _discountChecker = _subTotal / 100;
      _discountSum = (_subTotal * _discountChecker / 100).round();
      _totalSum -= _discountSum;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfbfbfb),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isSelected: false),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(-1, -1.5),
            image: AssetImage(Assets.imageLittleBackground),
            // opacity: 0.5,
            colorFilter: ColorFilter.mode(
              Color(0xFFe4ebe8),
              BlendMode.srcIn,
            ),
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 26.w, top: 11.h),
              child: Text(
                'Order details',
                style: defaultTextStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 26.sp,
                  color: AppColors.textColorBlack,
                ),
              ),
            ),
            16.height(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  if (userCartList.isNotEmpty)
                    for (int i = 0; i < userCartList.length; i++)
                      rowProductCreatorInCart(index: i)
                  else
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/gif/empty_cart.gif'),
                        Text(
                          'Your cart is empty. Go to home page! Add foods and comeback!',
                          textAlign: TextAlign.center,
                          style: defaultTextStyle.copyWith(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  250.height(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: userCartList.isNotEmpty
          ? Container(
              width: double.infinity,
              height: 240.h,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xFF004422),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/food_order_images/float_back.png',
                  ),
                  fit: BoxFit.fill,
                  alignment: Alignment.topRight,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF33694e),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.0.w, right: 23.w, top: 20.h),
                    child: Column(
                      children: [
                        CustomFloatRowMakerText(
                          text1: 'Sub total',
                          text2: 'Rs $_subTotal',
                          isSelected: false,
                        ),
                        CustomFloatRowMakerText(
                          text1: 'Delivery Charge',
                          text2: 'Rs $_deliverySum',
                          isSelected: false,
                        ),
                        CustomFloatRowMakerText(
                          text1: 'Discount',
                          text2: 'Rs $_discountSum',
                          isSelected: false,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0.w, right: 23.w),
                    child: CustomFloatRowMakerText(
                      text1: 'Total',
                      text2: 'Rs $_totalSum',
                      isSelected: true,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 12.w, right: 12.w, bottom: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomFloatButton(
                          buttonText: 'Go to home page',
                          onTapFunction: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) {
                                  return DashboardPage();
                                },
                              ),
                              (route) => false,
                            );
                          },
                          isSelected: false,
                        ),
                        CustomFloatButton(
                          buttonText: 'Place My Order',
                          onTapFunction: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(builder: (context) {
                                return const FoodOrderCompletePage();
                              }),
                              (route) => false,
                            );
                          },
                          isSelected: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              height: 60.h,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomFloatButton(
                buttonText: 'Go to home page',
                onTapFunction: () {
                  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(
                    builder: (context) {
                      return DashboardPage();
                    },
                  ), (route) => false);
                },
                isSelected: true,
              ),
            ),
    );
  }

  /// products in row creator that are in cart
  Widget rowProductCreatorInCart({required int index}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          height: 100.h,
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.darkGreen,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ],
          ),
        ),
        key: ValueKey(userCartList[index]),

        /// removing food from cart
        onDismissed: (direction) {
          setState(() {
            removeMoneyFromTotalSum(index: index);

            userCartList.removeAt(index);
          });
        },
        child: Row(
          children: [
            Container(
              width: 360.w,
              decoration: BoxDecoration(
                color: AppColors.mainTextColorWhite,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5A6CEA).withOpacity(0.07),
                    blurRadius: 10,
                    spreadRadius: 10,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 65.w,
                    height: 65.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            userCartList[index].foodImage,
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userCartList[index].foodName,
                        style: defaultTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.textColorBlack),
                      ),
                      Text(
                        'Food Factory LTD',
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF3B3B3B).withOpacity(0.3),
                        ),
                      ),
                      Text(
                        'Rs ${userCartList[index].foodPrice}',
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 19.sp,
                          color: AppColors.darkGreen,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      /// button to remove product
                      ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            removeMoneyFromTotalSum(index: index);
                          });
                        },
                        child: Container(
                          height: 27.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFF004422).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              Assets.iconMinus,
                            ),
                          ),
                        ),
                      ),
                      7.width(),
                      Text(
                        '${userCartList[index].foodAmount}',
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: const Color(0xFF181818).withOpacity(0.7),
                        ),
                      ),
                      7.width(),

                      /// button to add product
                      ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            if (userCartList[index].foodAmount < 10) {
                              userCartList[index].foodAmount++;
                              // adding food price to _subTotal
                              _subTotal +=
                                  int.parse(userCartList[index].foodPrice);
                              // adding delivery sum to _deliverySum
                              _deliverySum += 50;

                              // adding subTotal and deliverySum to _totalSum
                              _totalSum = _totalSum +
                                  int.parse(userCartList[index].foodPrice) +
                                  50;

                              // discount calculator for adding
                              _totalSum += _discountSum;
                              _discountChecker = _subTotal / 100;
                              _discountSum =
                                  (_subTotal * _discountChecker / 100).round();
                              _totalSum -= _discountSum;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          height: 27.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            color: AppColors.darkGreen,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: SvgPicture.asset(
                            Assets.iconPlus,
                            height: 11.h,
                            width: 11.w,
                          ),
                        ),
                      ),
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

  void removeMoneyFromTotalSum({required int index}) {
    if (userCartList[index].foodAmount > 0) {
      userCartList[index].foodAmount--;

      // subtracting food price from _subTotal
      int foodPrice = int.parse(userCartList[index].foodPrice);
      _subTotal -= foodPrice;

      // subtracting delivery fee from _deliverySum
      _deliverySum -= 50;

      // recalculate the discount
      _discountChecker = _subTotal / 100;
      _discountSum = (_subTotal * _discountChecker / 100).round();

      // calculate the new _totalSum
      _totalSum = _subTotal + _deliverySum - _discountSum;
    }
  }
}
