import 'package:arestro_app/generated/assets.dart';

class MomoFoodData {
  String foodImage;
  String foodName;
  String foodPrice;

  MomoFoodData({
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
  });
}

List<MomoFoodData> momoFoodDataList = [
  MomoFoodData(foodImage: Assets.imageMomo1, foodName: 'Veggie', foodPrice: '310'),
  MomoFoodData(foodImage: Assets.imageMomo2, foodName: 'Chicken Fried', foodPrice: '300'),
  MomoFoodData(foodImage: Assets.imageMomo3, foodName: 'Salad', foodPrice: '420'),
  MomoFoodData(foodImage: Assets.imageMomo4, foodName: 'Spicy Paneer', foodPrice: '150'),
  MomoFoodData(foodImage: Assets.imageMomo5, foodName: 'Steak', foodPrice: '270'),
];
