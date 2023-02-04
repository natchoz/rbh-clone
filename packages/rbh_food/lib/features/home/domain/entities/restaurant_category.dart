import 'package:rbh_food/features/home/domain/entities/restaurant.dart';

class RestaurantCategory {
  RestaurantCategory({
    required this.recommendedRestaurants,
    required this.bestChineseRestaurants,
  });

  final List<Restaurant> recommendedRestaurants;
  final List<Restaurant> bestChineseRestaurants;
}
