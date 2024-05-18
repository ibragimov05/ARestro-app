import 'package:arestro_app/screens/1_onboarding/signup.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/main_green_button.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OrContinueWithWidget extends StatelessWidget {
  final String googleButtonText;
  final String accountText;
  final String accountButtonText;
  final Widget nextPageName;

  const OrContinueWithWidget({
    super.key,
    required this.googleButtonText,
    required this.accountText,
    required this.accountButtonText,
    required this.nextPageName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(),
            ),
            9.width(),
            Text(
              'or continue with',
              style: defaultTextStyle,
            ),
            9.width(),
            Expanded(
              child: Divider(),
            ),
          ],
        ),
        32.height(),

        /// login with google button
        OnboardingGreenButton(
          buttonText: '$googleButtonText with Google',
          isSelected: false,
          isIconSelected: true,
          onPressed: () {},
        ),
        20.height(),

        /// button for sign up
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              accountText,
              style: defaultTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return nextPageName;
                    },
                  ),
                );
              },
              child: Text(
                accountButtonText,
                style: defaultTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xFF2F89FC),
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF2F89FC),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
