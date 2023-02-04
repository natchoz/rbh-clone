import 'package:dio/dio.dart';
import 'package:rbh_food/features/home/data/dto/get_restaurant_category_response.dart';
import 'package:retrofit/retrofit.dart';

part 'food_api.g.dart';

@RestApi()
abstract class FoodApi {
  factory FoodApi(Dio dio) = _FoodApi;

  @GET('/restaurant-category')
  Future<GetRestaurantCategoryResponse> getRestaruntCategory();
}
