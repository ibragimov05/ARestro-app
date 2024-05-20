import 'package:arestro_app/generated/assets.dart';

class BurgerFoodData {
  String foodImage;
  String foodName;
  String foodPrice;

  BurgerFoodData({
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
  });
}

List<BurgerFoodData> burgerFoodDataList = [
  BurgerFoodData(
    foodImage: Assets.imageBurger1,
    foodName: 'Cheeseburger',
    foodPrice: '310',
  ),
  BurgerFoodData(
    foodImage: Assets.imageBurger2,
    foodName: 'DoubleBurger',
    foodPrice: '300',
  ),
  BurgerFoodData(
    foodImage: Assets.imageBurger3,
    foodName: 'VeggieBurger',
    foodPrice: '420',
  ),
  BurgerFoodData(
    foodImage: Assets.imageBurger4,
    foodName: 'ChickenBurger',
    foodPrice: '150',
  ),
];
