import 'package:rbh_food/features/home/domain/entities/home_restaurant.dart';

class RestaurantCategory {
  RestaurantCategory({
    required this.recommendedRestaurants,
    required this.bestChineseRestaurants,
  });

  final List<HomeRestaurant> recommendedRestaurants;
  final List<HomeRestaurant> bestChineseRestaurants;
}
