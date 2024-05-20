import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/models/user_data.dart';
import 'package:arestro_app/screens/1_onboarding/login.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/custom_text_field.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/main_green_button.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/or_continue_with_widget.dart';
import 'package:arestro_app/screens/1_onboarding/widgets/validator.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController userNameTextEditController =
      TextEditingController();

  final TextEditingController userEmailTextEditingController =
      TextEditingController();

  final TextEditingController userPhoneNumberTextEditingController =
      TextEditingController();

  final TextEditingController userPasswordTextEditingController =
      TextEditingController();

  String userNameErrorMessage = '';

  String userEmailErrorMessage = '';

  String userPhoneNumberErrorMessage = '';

  String userPasswordErrorMessage = '';
  @override
  void dispose() {
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
                height: checkErrorMessage() ? 10.h : 60.h,
              ),

              /// logo
              SvgPicture.asset(
                Assets.imageMainLogo,
                height: 108.h,
                width: 108.w,
              ),
              26.height(),
              Text(
                'Create an account',
                textAlign: TextAlign.center,
                style: defaultTextStyle.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              20.height(),

              /// text field for username
              CustomTextField(
                hintText: 'Enter Your Username',
                textFieldText: '',
                textEditingController: userNameTextEditController,
                errorMessage: userNameErrorMessage,
                isPassword: false,
                textInputType: TextInputType.text,
              ),
              15.height(),

              /// text field for email
              CustomTextField(
                hintText: 'Enter Your Email',
                textFieldText: '',
                textEditingController: userEmailTextEditingController,
                errorMessage: userEmailErrorMessage,
                isPassword: false,
                textInputType: TextInputType.emailAddress,
              ),
              15.height(),

              /// text field for phone number
              CustomTextField(
                hintText: 'Enter Your Phone Number',
                textFieldText: '',
                textEditingController: userPhoneNumberTextEditingController,
                errorMessage: userPhoneNumberErrorMessage,
                isPassword: false,
                textInputType: TextInputType.phone,
              ),
              15.height(),

              /// text field for password
              CustomTextField(
                hintText: 'Enter Your Password',
                textFieldText: '',
                textEditingController: userPasswordTextEditingController,
                errorMessage: userPasswordErrorMessage,
                isPassword: true,
                textInputType: TextInputType.text,
              ),
              20.height(),

              OnboardingGreenButton(
                buttonText: 'Sign Up',
                isSelected: true,
                isIconSelected: false,
                onPressed: () {
                  List<bool> isUserEnteredAllTrue = [
                    false,
                    false,
                    false,
                    false,
                  ];

                  /// checking username
                  if (userNameTextEditController.text.isEmpty ||
                      userNameTextEditController.text.length < 4) {
                    userNameErrorMessage = 'Enter a valid user name';
                  } else if (!Validator.checkUserNameAvailable(
                      userName: userNameTextEditController.text)) {
                    userNameErrorMessage = 'User name already taken';
                  } else {
                    userNameErrorMessage = '';
                    isUserEnteredAllTrue[0] = true;
                  }

                  ///checking email
                  if (!Validator.isValidEmail(
                      email: userEmailTextEditingController.text)) {
                    userEmailErrorMessage = 'Enter a valid email';
                  } else {
                    userEmailErrorMessage = '';
                    isUserEnteredAllTrue[1] = true;
                  }

                  /// checking phone number
                  if (!Validator.isValidPhoneNumber(
                          phoneNumber:
                              userPhoneNumberTextEditingController.text) ||
                      userPhoneNumberTextEditingController.text.length > 12) {
                    userPhoneNumberErrorMessage = 'Enter a valid phone number';
                  } else {
                    userPhoneNumberErrorMessage = '';
                    isUserEnteredAllTrue[2] = true;
                  }

                  /// checking password
                  if (userPasswordTextEditingController.text.length < 8) {
                    userPasswordErrorMessage =
                        'Password should be longer than 8 characters';
                  } else if (!Validator.isValidPassword(
                      password: userPasswordTextEditingController.text)) {
                    userPasswordErrorMessage =
                        'Use symbols upper and lower case letters';
                  } else {
                    userPasswordErrorMessage = '';
                    isUserEnteredAllTrue[3] = true;
                  }
                  setState(() {});

                  /// adding user info to list
                  if (isUserEnteredAllTrue[0] &&
                      isUserEnteredAllTrue[1] &&
                      isUserEnteredAllTrue[2] &&
                      isUserEnteredAllTrue[3]) {
                    userDataList.add(
                      UserData(
                        userUserName: userNameTextEditController.text,
                        userEmail: userEmailTextEditingController.text,
                        userPhoneNumber:
                            userPhoneNumberTextEditingController.text,
                        userPassword: userPasswordTextEditingController.text,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                    );
                  }
                },
              ),

              32.height(),
              const OrContinueWithWidget(
                googleButtonText: 'Signup',
                accountText: 'Already have an account? ',
                accountButtonText: 'Login',
                nextPageName: LoginPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkErrorMessage() {
    int counterForFilledErrorMessage = 0;
    List errorMessages = <String>[
      userNameErrorMessage,
      userEmailErrorMessage,
      userPhoneNumberErrorMessage,
      userPasswordErrorMessage,
    ];
    for (String each in errorMessages) {
      if (each.isNotEmpty) {
        counterForFilledErrorMessage += 1;
      }
    }
    if (counterForFilledErrorMessage >= 2) {
      return true;
    }
    return false;
  }
}
