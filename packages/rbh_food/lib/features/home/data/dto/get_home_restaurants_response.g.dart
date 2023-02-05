// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_restaurants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeRestaurantsResponse _$GetHomeRestaurantsResponseFromJson(
        Map<String, dynamic> json) =>
    GetHomeRestaurantsResponse(
      (json['recommended_restaurants'] as List<dynamic>)
          .map((e) => HomeRestaurantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['best_chinese_restaurants'] as List<dynamic>)
          .map((e) => HomeRestaurantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHomeRestaurantsResponseToJson(
        GetHomeRestaurantsResponse instance) =>
    <String, dynamic>{
      'recommended_restaurants': instance.recommendedRestaurants,
      'best_chinese_restaurants': instance.bestChineseRestaurants,
    };

HomeRestaurantDto _$HomeRestaurantDtoFromJson(Map<String, dynamic> json) =>
    HomeRestaurantDto(
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

Map<String, dynamic> _$HomeRestaurantDtoToJson(HomeRestaurantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'distance': instance.distance,
      'rating': instance.rating,
      'category_menus': instance.categoryMenus,
    };
