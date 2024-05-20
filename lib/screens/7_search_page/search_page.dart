import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/extension/sized_box_extension.dart';
import 'package:arestro_app/utils/widgets/bottom_navigation_bar.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:arestro_app/utils/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isSelected: false),
      ),
      body: ListView(
        children: [
          16.height(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CustomSearchBar(isSearchable: true),
          ),
          Image.asset(
            'assets/gif/search_animation.gif',
          ),
        ],
      ),
      bottomNavigationBar: CustomTabBox(),
    );
  }
}
