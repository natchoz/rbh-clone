import 'package:json_annotation/json_annotation.dart';

part 'get_restaurants_response.g.dart';

@JsonSerializable()
class GetRestaurantsResponse {
  GetRestaurantsResponse(this.restaruants);

  factory GetRestaurantsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRestaurantsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRestaurantsResponseToJson(this);

  @JsonKey(name: 'restaurants')
  final List<RestaurantDto> restaruants;
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
    required this.categories,
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

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  @JsonKey(name: 'distance')
  final String? distance;

  @JsonKey(name: 'rating')
  final double? rating;

  @JsonKey(name: 'categories')
  final List<CategoryDto> categories;
}

@JsonSerializable()
class CategoryDto {
  const CategoryDto({
    required this.id,
    required this.name,
    required this.menus,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'menus')
  final List<MenuDto> menus;
}

@JsonSerializable()
class MenuDto {
  const MenuDto({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.active,
  });

  factory MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MenuDtoToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  @JsonKey(name: 'price')
  final double price;

  @JsonKey(name: 'active')
  final bool active;
}
