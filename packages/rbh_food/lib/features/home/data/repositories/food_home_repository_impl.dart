import 'package:core/error/failure.dart';
import 'package:flutter/services.dart';
import 'package:rbh_food/features/home/data/api/food_api.dart';
import 'package:rbh_food/features/home/data/mapper/home_restaruant_category_mapper.dart';
import 'package:rbh_food/features/home/domain/entities/home_restaurant.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';
import 'package:rbh_food/features/home/domain/repositories/food_home_repository.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class FoodHomeRepositoryImpl implements FoodHomeRepository {
  FoodHomeRepositoryImpl(this._foodApi, this._restaruntCategoryMapper);

  final FoodApi _foodApi;
  final RestaruntCategoryMapper _restaruntCategoryMapper;

  @override
  Future<Either<Failure, RestaurantCategory>> getRestaurantCategory() async {
    try {
      final response = await _foodApi.getHomeRestaurantCategories();
      return Right(_restaruntCategoryMapper.mapDtoToEntity(response));

      // final response = await _foodApi.getRestaruntCategory2();
      // return Right(RestaurantCategory(recommendedRestaurants: [], bestChineseRestaurants: []));
    } on DioError catch (e) {
      print("--- DioError # $e ---");
      print("--- DioError # ${e.message} ---");
      return Left(Failure(e.message));
    }
  }
}
