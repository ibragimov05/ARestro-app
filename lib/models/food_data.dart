import 'package:arestro_app/generated/assets.dart';

class FoodData {
  String foodImage;
  String foodName;
  String foodPrice;

  FoodData({
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
  });
}

List<FoodData> foodDataList = [
  FoodData(foodImage: Assets.imageFood1, foodName: 'Palov', foodPrice: '310'),
  FoodData(foodImage: Assets.imageFood2, foodName: 'Soup', foodPrice: '285'),
  FoodData(foodImage: Assets.imageFood3, foodName: 'Manti', foodPrice: '300'),
];
