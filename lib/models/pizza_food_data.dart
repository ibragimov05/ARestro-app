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
    foodImage: Assets.imagePizza1,
    foodName: 'Margherita',
    foodPrice: '310',
  ),
  PizzaFoodData(
    foodImage: Assets.imagePizza2,
    foodName: 'Pepperoni',
    foodPrice: '300',
  ),
  PizzaFoodData(
    foodImage: Assets.imagePizza3,
    foodName: 'BBQ Chicken',
    foodPrice: '420',
  ),
  PizzaFoodData(
    foodImage: Assets.imagePizza4,
    foodName: 'Veggie Supreme',
    foodPrice: '150',
  ),
];
