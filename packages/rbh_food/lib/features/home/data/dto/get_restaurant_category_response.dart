import 'package:json_annotation/json_annotation.dart';

part 'get_restaurant_category_response.g.dart';

@JsonSerializable()
class GetRestaurantCategoryResponse {
  GetRestaurantCategoryResponse(
    this.recommendedRestaurants,
    this.bestChineseRestaurants,
  );

  factory GetRestaurantCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRestaurantCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRestaurantCategoryResponseToJson(this);

  @JsonKey(name: 'recommended_restaurants')
  final List<RestaurantDto> recommendedRestaurants;

  @JsonKey(name: 'best_chinese_restaurants')
  final List<RestaurantDto> bestChineseRestaurants;
}

@JsonSerializable()
class RestaurantDto {
  RestaurantDto({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.distance,
    this.rating,
    required this.categoryMenus,
  });

  factory RestaurantDto.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDtoToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'distance')
  final String? distance;

  @JsonKey(name: 'rating')
  final double? rating;

  @JsonKey(name: 'category_menus')
  final List<String> categoryMenus;
}
