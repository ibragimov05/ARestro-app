import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/screens/1_onboarding/login.dart';
import 'package:arestro_app/screens/1_onboarding/signup.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/main_green_button.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 39.w),
          child: Column(
            children: [
              /// main logo in center
              166.height(),
              SvgPicture.asset(
                Assets.imageMainLogo,
                height: 179.h,
                width: 179.w,
              ),
              27.height(),
              Text(
                'ARestro',
                style: defaultTextStyle.copyWith(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              131.height(),

              /// button that takes to login page
              OnboardingGreenButton(
                buttonText: 'Log In',
                isSelected: true,
                isIconSelected: false,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
              ),
              16.height(),

              /// button that takes to sign up page
              OnboardingGreenButton(
                buttonText: 'Sign Up',
                isSelected: false,
                isIconSelected: false,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return SignupPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
