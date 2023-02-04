// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_restaurants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRestaurantsResponse _$GetRestaurantsResponseFromJson(
        Map<String, dynamic> json) =>
    GetRestaurantsResponse(
      (json['restaurants'] as List<dynamic>)
          .map((e) => RestaurantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRestaurantsResponseToJson(
        GetRestaurantsResponse instance) =>
    <String, dynamic>{
      'restaurants': instance.restaruants,
    };

RestaurantDto _$RestaurantDtoFromJson(Map<String, dynamic> json) =>
    RestaurantDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      distance: json['distance'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantDtoToJson(RestaurantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'distance': instance.distance,
      'rating': instance.rating,
      'categories': instance.categories,
    };

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      id: json['id'] as String,
      name: json['name'] as String,
      menus: (json['menus'] as List<dynamic>)
          .map((e) => MenuDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'menus': instance.menus,
    };

MenuDto _$MenuDtoFromJson(Map<String, dynamic> json) => MenuDto(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$MenuDtoToJson(MenuDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'active': instance.active,
    };
