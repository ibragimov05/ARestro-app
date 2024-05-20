import 'package:arestro_app/generated/assets.dart';

class UserCart {
  String foodImage;
  String foodName;
  String foodPrice;
  int foodAmount;

  UserCart({
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    required this.foodAmount,
  });
}

List<UserCart> userCartList = [];
