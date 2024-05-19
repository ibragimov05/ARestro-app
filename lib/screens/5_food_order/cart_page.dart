import 'package:arestro_app/utils/colors/colors.dart';
import 'package:arestro_app/utils/widgets/bottom_navigation_bar.dart';
import 'package:arestro_app/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      bottomNavigationBar: CustomTabBox(),
    );
  }
}
