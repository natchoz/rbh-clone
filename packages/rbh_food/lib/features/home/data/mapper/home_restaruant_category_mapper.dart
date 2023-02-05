import 'package:rbh_food/features/home/data/dto/get_home_restaurants_response.dart';
import 'package:rbh_food/features/home/domain/entities/home_restaurant.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';

class RestaruntCategoryMapper {
  RestaurantCategory mapDtoToEntity(GetHomeRestaurantsResponse response) =>
      RestaurantCategory(
        recommendedRestaurants: response.recommendedRestaurants
            .map(
              (data) => HomeRestaurant(
                id: data.id,
                name: data.name,
                description: data.description,
                distance: data.distance,
                imageUrl: data.imageUrl,
                rating: data.rating,
                categoryMenus: data.categoryMenus,
              ),
            )
            .toList(),
        bestChineseRestaurants: response.bestChineseRestaurants
            .map(
              (data) => HomeRestaurant(
                id: data.id,
                name: data.name,
                description: data.description,
                distance: data.distance,
                imageUrl: data.imageUrl,
                rating: data.rating,
                categoryMenus: data.categoryMenus,
              ),
            )
            .toList(),
      );
}
