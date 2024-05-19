import 'package:arestro_app/generated/assets.dart';

class PizzaFoodData {
  String foodImage;
  String foodName;
  String foodPrice;

  PizzaFoodData({
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
  });
}

List<PizzaFoodData> pizzaFoodDataList = [
  PizzaFoodData(
      foodImage: Assets.imagePizza1, foodName: 'Margherita Pizza', foodPrice: '310'),
  PizzaFoodData(
      foodImage: Assets.imagePizza2, foodName: 'Pepperoni Pizza', foodPrice: '300'),
  PizzaFoodData(
      foodImage: Assets.imagePizza3, foodName: 'BBQ Chicken Pizza', foodPrice: '420'),
  PizzaFoodData(
      foodImage: Assets.imagePizza4, foodName: 'Veggie Supreme Pizza', foodPrice: '150'),
];
