import 'package:arestro_app/screens/1_onboarding/login.dart';
import 'package:arestro_app/screens/1_onboarding/signup.dart';
import 'package:arestro_app/screens/1_onboarding/start.dart';
import 'package:arestro_app/screens/2_dashboard/dashboard.dart';
import 'package:arestro_app/screens/5_food_order/cart_page.dart';
import 'package:arestro_app/screens/5_food_order/food_order_complete.dart';
import 'package:arestro_app/screens/7_search_page/search_page.dart';
import 'package:arestro_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardPage();
  }
}
