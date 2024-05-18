import 'package:arestro_app/generated/assets.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String textFieldText;
  final TextEditingController textEditingController;
  final String errorMessage;
  final bool isPassword;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textFieldText,
    required this.textEditingController,
    required this.errorMessage,
    required this.isPassword,
    required this.textInputType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPressed = false;
  bool isObscure = false;

  @override
  void initState() {
    if (widget.isPassword) {
      isObscure = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// text
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: widget.textFieldText.isEmpty
                  ? null
                  : Text(
                      widget.textFieldText,
                      style: defaultTextStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColorBlack,
                      ),
                    ),
            ),
          ],
        ),
        6.height(),

        /// text field
        TextField(
          cursorColor: AppColors.mainTextGreyColor,
          keyboardType: widget.textInputType,
          textInputAction:
              widget.isPassword ? TextInputAction.done : TextInputAction.next,
          obscureText: isObscure,
          controller: widget.textEditingController,
          inputFormatters: widget.hintText == 'Enter Your Phone Number'
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp(r'\+')),
                ]
              : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: AppColors.mainTextGreyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: AppColors.mainTextGreyColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            // errorText: e,
            errorText: widget.errorMessage == '' ? null : widget.errorMessage,
            hintText: widget.hintText,
            prefixText:
                widget.hintText == 'Enter Your Phone Number' ? '+ ' : null,
            hintStyle: defaultTextStyle.copyWith(
              color: AppColors.mainTextGreyColor,
              fontSize: 16.sp,
            ),

            /// suffix icon to hide and unhide password
            suffixIcon: widget.isPassword
                ? ZoomTapAnimation(
                    onTap: () {
                      setState(() {
                        isPressed = !isPressed;
                        isObscure = !isObscure;
                      });
                    },
                    child: isPressed
                        ? Icon(
                            Icons.remove_red_eye,
                            color: Color(0xFF7f7f7f),
                          )
                        : Image.asset(Assets.iconPasswordHidden),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.contains('+')) {
      return oldValue;
    }
    return newValue;
  }
}
