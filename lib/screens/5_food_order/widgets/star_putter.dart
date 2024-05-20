import 'package:arestro_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  State<StarScreen> createState() {
    return _StarScreenState();
  }
}

class _StarScreenState extends State<StarScreen> {
  List colorStar = [
    Assets.iconStarUnSelected,
    Assets.iconStarUnSelected,
    Assets.iconStarUnSelected,
    Assets.iconStarUnSelected,
    Assets.iconStarUnSelected,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const SizedBox(height: 500),
        for (int i = 0; i < 5; i++)
          ZoomTapAnimation(
            onTap: () {
              setState(() {
                for (var j = 0; j < colorStar.length; j++) {
                  if (j <= i) {
                    colorStar[j] = Assets.iconStarYellow;
                  } else {
                    colorStar[j] = Assets.iconStarUnSelected;
                  }
                }
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 20.w),
              child: SvgPicture.asset(
                colorStar[i],
                height: 33.h,
                width: 33.w,
              ),
            ),
          ),
        // Assets
      ],
    );
  }
}
