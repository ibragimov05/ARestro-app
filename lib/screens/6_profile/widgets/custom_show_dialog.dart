import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/text_style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Status',
        style: defaultTextStyle.copyWith(
          fontWeight: FontWeight.w800,
          color: AppColors.darkGreen,
          fontSize: 25.sp,
        ),
      ),
      content: Text(
        'You have to contact administration in order to make change',
        style: defaultTextStyle.copyWith(
          color: AppColors.mainTextGreyColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(
                AppColors.mainTextGreyColor.withOpacity(0.05),
              ),
              foregroundColor:
              MaterialStatePropertyAll(Colors.black)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
