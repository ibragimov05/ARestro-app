import 'package:arestro_app/generated/assets.dart';

class RestaurantData {
  String restaurantImagePath;
  String restaurantName;
  String restaurantRating;

  RestaurantData({
    required this.restaurantImagePath,
    required this.restaurantName,
    required this.restaurantRating,
  });
}

List<RestaurantData> restaurantDataList = [
  RestaurantData(
    restaurantImagePath: Assets.imageRes1,
    restaurantName: 'Celler de Can Roca, Spain',
    restaurantRating: '4.8',
  ),
  RestaurantData(
    restaurantImagePath: Assets.imageRes2,
    restaurantName: 'Osteria Francescana, Italy',
    restaurantRating: '4.7',
  ),
  RestaurantData(
    restaurantImagePath: Assets.imageRes3,
    restaurantName: 'Mugaritz, Errenteria, Spain',
    restaurantRating: '4.9',
  ),
  RestaurantData(
    restaurantImagePath: Assets.imageRes4,
    restaurantName: 'Alinea, Chicago, Illinois',
    restaurantRating: '4.5',
  ),
];
