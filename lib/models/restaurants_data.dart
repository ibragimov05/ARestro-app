import 'package:arestro_app/generated/assets.dart';

class RestaurantData {
  String restaurantImagePath;
  String restaurantName;
  String restaurantRating;
  String restaurantDescription;

  RestaurantData({
    required this.restaurantImagePath,
    required this.restaurantName,
    required this.restaurantRating,
    required this.restaurantDescription,
  });
}

List<RestaurantData> restaurantDataList = [
  RestaurantData(
    restaurantImagePath: Assets.imageRes1,
    restaurantName: 'Celler de Can Roca, Spain',
    restaurantRating: '4.8',
    restaurantDescription:
        'A three-Michelin-star restaurant in Girona, renowned for its innovative and artistic cuisine. Run by the Roca brothers—Joan, Josep, and Jordi—the restaurant offers a unique culinary journey inspired by their Catalan roots and global influences. The combination of exceptional dishes, exquisite wine pairings, and impeccable service makes it a must-visit destination for food enthusiasts.',
  ),
  RestaurantData(
    restaurantImagePath: Assets.imageRes2,
    restaurantName: 'Osteria Francescana, Italy',
    restaurantRating: '4.7',
    restaurantDescription:
        'Located in the heart of Modena, this three-Michelin-star restaurant is led by the visionary chef Massimo Bottura. Osteria Francescana blends tradition with contemporary techniques, presenting a modern twist on classic Italian dishes. Known for its artistic presentation and profound flavors, the restaurant has garnered numerous accolades and a loyal international following.',
  ),
  RestaurantData(
    restaurantImagePath: Assets.imageRes3,
    restaurantName: 'Mugaritz, Errenteria, Spain',
    restaurantRating: '4.9',
    restaurantDescription:
        'Situated in the Basque country, Mugaritz is a two-Michelin-star restaurant that is as much a gastronomic laboratory as it is a dining destination. Under the guidance of chef Andoni Luis Aduriz, Mugaritz pushes the boundaries of culinary creativity with avant-garde dishes that challenge conventional notions of taste and texture. Each visit promises a unique and thought-provoking culinary experience.',
  ),
  RestaurantData(
    restaurantImagePath: Assets.imageRes4,
    restaurantName: 'Alinea, Chicago, Illinois',
    restaurantRating: '4.5',
    restaurantDescription:
        'Alinea, a three-Michelin-star restaurant in Chicago, is celebrated for its pioneering approach to molecular gastronomy. Chef Grant Achatz leads a team dedicated to redefining the dining experience through innovative techniques and imaginative presentations. Guests can expect an immersive journey through a series of meticulously crafted courses that engage all the senses, making Alinea a culinary icon in the United States.',
  ),
];
