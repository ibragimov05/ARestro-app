import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/screens/5_food_order/widgets/float_button_maker.dart';
import 'package:arestro_app/screens/6_profile/widgets/custom_show_dialog.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:arestro_app/utils/widgets/custom_floating_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool cupertinoSwitchButtonValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isSelected: true),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(-1, -1.3),
            image: AssetImage(Assets.imageLittleBackground),
            // opacity: 0.5,
            colorFilter: ColorFilter.mode(
              Color(0xFFe4ebe8),
              BlendMode.srcIn,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 20.height(),

              /// user photo
              Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF3f657c),
                    Color(0xFF8f2b34),
                  ]),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  Assets.imageProfilePhoto,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: Color(0xFF009944).withOpacity(0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal info',
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 17.sp,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    20.height(),
                    SizedBox(
                      height: 180.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            rowMaker(
                              text1: 'Your name',
                              text2: 'Bibhushan Saakha',
                              isSelected: false,
                            ),
                            rowMaker(
                              text1: 'Occupation',
                              text2: 'Student',
                              isSelected: false,
                            ),
                            rowMaker(
                              text1: 'Address',
                              text2: 'Koteshwor, Kathmandu',
                              isSelected: false,
                            ),
                            rowMaker(
                              text1: 'Member',
                              text2: '',
                              isSelected: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: Color(0xFF009944).withOpacity(0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Info',
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 17.sp,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    16.height(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SizedBox(
                        height: 70.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            rowMaker(
                              text1: 'Phone number',
                              text2: '+977 9840103828',
                              isSelected: false,
                            ),
                            rowMaker(
                              text1: 'Email',
                              text2: 'bibhushansaakha@gmail.com',
                              isSelected: false,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ///////////////////////////////////////////////
              1.height(),
            ],
          ),
        ),
      ),

      /// float action button for edit button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        buttonText: 'Edit',
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return CustomShowDialog();
            },
          );
        },
      ),
    );
  }

  Widget rowMaker(
      {required String text1,
      required String text2,
      required bool isSelected}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: defaultTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
            color: Color(0xFF3B3B3B),
          ),
        ),
        if (!isSelected)
          Text(
            text2,
            style: defaultTextStyle.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
              color: AppColors.textColorBlack,
            ),
          )
        else
          CupertinoSwitch(
            onChanged: (value) {
              setState(() {
                cupertinoSwitchButtonValue = !cupertinoSwitchButtonValue;
              });
            },
            value: cupertinoSwitchButtonValue,
          ),
      ],
    );
  }
}
