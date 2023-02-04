// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_restaurant_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRestaurantCategoryResponse _$GetRestaurantCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    GetRestaurantCategoryResponse(
      (json['recommended_restaurants'] as List<dynamic>)
          .map((e) => RestaurantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['best_chinese_restaurants'] as List<dynamic>)
          .map((e) => RestaurantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRestaurantCategoryResponseToJson(
        GetRestaurantCategoryResponse instance) =>
    <String, dynamic>{
      'recommended_restaurants': instance.recommendedRestaurants,
      'best_chinese_restaurants': instance.bestChineseRestaurants,
    };

RestaurantDto _$RestaurantDtoFromJson(Map<String, dynamic> json) =>
    RestaurantDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      distance: json['distance'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      categoryMenus: (json['category_menus'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RestaurantDtoToJson(RestaurantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'distance': instance.distance,
      'rating': instance.rating,
      'category_menus': instance.categoryMenus,
    };
