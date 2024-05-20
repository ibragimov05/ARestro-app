import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/user_data.dart';
import 'package:arestro_app/screens/1_onboarding/signup.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/custom_text_field.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/main_green_button.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/or_continue_with_widget.dart';
import 'package:arestro_app/screens/2_dashboard/dashboard.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailTextEditController = TextEditingController();

  final TextEditingController passwordTextEditController =
      TextEditingController();

  String emailErrorMessage = '';

  String passwordErrorMessage = '';
  bool isRememberMeButtonPressed = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 39.w),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),

            children: [
              SizedBox(
                height: checkErrorMessage() ? 40.h : 70.h,
              ),

              /// logo
              SvgPicture.asset(
                Assets.imageMainLogo,
                height: 108.h,
                width: 108.w,
              ),
              26.height(),
              Text(
                'Log In',
                textAlign: TextAlign.center,
                style: defaultTextStyle.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              18.height(),

              /// email text field
              CustomTextField(
                hintText: 'example@gmail.com',
                textFieldText: 'Email',
                textEditingController: emailTextEditController,
                errorMessage: emailErrorMessage,
                isPassword: false,
                textInputType: TextInputType.emailAddress,
              ),
              20.height(),

              /// password text field
              CustomTextField(
                hintText: 'Enter Your Password',
                textFieldText: 'Password',
                textEditingController: passwordTextEditController,
                errorMessage: passwordErrorMessage,
                isPassword: true,
                textInputType: TextInputType.text,
              ),
              24.height(),

              /// remember me and forgot password buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isRememberMeButtonPressed =
                                !isRememberMeButtonPressed;
                          });
                        },
                        child: Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                              color: const Color(0xFFCDD1E0),
                            ),
                          ),
                          child: isRememberMeButtonPressed
                              ? Icon(
                                  Icons.check,
                                  size: 16.sp,
                                  color: AppColors.textColorBlack,
                                )
                              : null,
                        ),
                      ),
                      7.width(),
                      Text(
                        'Remember Me',
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  ZoomTapAnimation(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: defaultTextStyle.copyWith(
                        color: AppColors.forgotPassword,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
              33.height(),

              /// login button
              OnboardingGreenButton(
                buttonText: 'Login',
                isSelected: true,
                isIconSelected: false,
                onPressed: () {
                  bool isUserFound = false;
                  bool isPasswordTrue = false;

                  /// checking whether user exists
                  for (var each in userDataList) {
                    if (each.userEmail == emailTextEditController.text) {
                      isUserFound = true;
                      if (each.userPassword ==
                          passwordTextEditController.text) {
                        isPasswordTrue = true;
                        break;
                      }
                      break;
                    }
                  }

                  /// user not found or entered invalid password
                  setState(() {
                    if (emailTextEditController.text.isNotEmpty) {
                      if (!isUserFound) {
                        passwordErrorMessage = '';
                        emailErrorMessage =
                            'Couldn\'t find user with email ${emailTextEditController.text}';
                      } else if (!isPasswordTrue) {
                        emailErrorMessage = '';
                        passwordErrorMessage = 'Password you entered is false';
                      }
                    } else {
                      emailErrorMessage = 'Email can\'t be empty';
                    }
                  });

                  /// user found and redirect to dashboard page
                  if (isUserFound && isPasswordTrue) {
                    emailErrorMessage = '';
                    passwordErrorMessage = '';
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return DashboardPage();
                        },
                      ),
                    );
                  }
                },
              ),
              59.height(),
              const OrContinueWithWidget(
                googleButtonText: 'Login',
                accountText: 'Don’t have an account ? ',
                accountButtonText: 'Signup',
                nextPageName: SignupPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkErrorMessage() {
    if (emailErrorMessage.isNotEmpty || passwordErrorMessage.isNotEmpty) {
      return true;
    }
    return false;
  }
}
