import 'package:json_annotation/json_annotation.dart';

part 'get_home_restaurants_response.g.dart';

@JsonSerializable()
class GetHomeRestaurantsResponse {
  GetHomeRestaurantsResponse(
    this.recommendedRestaurants,
    this.bestChineseRestaurants,
  );

  factory GetHomeRestaurantsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHomeRestaurantsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeRestaurantsResponseToJson(this);

  @JsonKey(name: 'recommended_restaurants')
  final List<HomeRestaurantDto> recommendedRestaurants;

  @JsonKey(name: 'best_chinese_restaurants')
  final List<HomeRestaurantDto> bestChineseRestaurants;
}

@JsonSerializable()
class HomeRestaurantDto {
  HomeRestaurantDto({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.distance,
    this.rating,
    required this.categoryMenus,
  });

  factory HomeRestaurantDto.fromJson(Map<String, dynamic> json) =>
      _$HomeRestaurantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeRestaurantDtoToJson(this);

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
