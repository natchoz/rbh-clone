import 'package:rbh_food/features/home/data/dto/get_restaurant_category_response.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';

class RestaruntCategoryMapper {
  RestaurantCategory mapDtoToEntity(GetRestaurantCategoryResponse response) =>
      RestaurantCategory(
        recommendedRestaurants: response.recommendedRestaurants
            .map(
              (data) => Restaurant(
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
              (data) => Restaurant(
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
