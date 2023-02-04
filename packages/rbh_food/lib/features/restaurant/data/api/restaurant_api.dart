import 'package:dio/dio.dart';
import 'package:rbh_food/features/home/data/dto/get_restaurant_category_response.dart';
import 'package:rbh_food/features/restaurant/data/dto/get_restaurants_response.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_api.g.dart';

@RestApi()
abstract class RestaurantApi {
  factory RestaurantApi(Dio dio) = _RestaurantApi;

  @GET('/restaurants')
  Future<GetRestaurantsResponse> getRestaurantsResponse();
}
