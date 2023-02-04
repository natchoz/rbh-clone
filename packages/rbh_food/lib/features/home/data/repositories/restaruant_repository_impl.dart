import 'package:core/error/failure.dart';
import 'package:flutter/services.dart';
import 'package:rbh_food/features/home/data/api/food_api.dart';
import 'package:rbh_food/features/home/data/mapper/restaruant_category_mapper.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';
import 'package:rbh_food/features/home/domain/repositories/food_repository.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class RestaruantRepositoryImpl implements RestaurantRepository {
  RestaruantRepositoryImpl(this._foodApi, this._restaruntCategoryMapper);

  final FoodApi _foodApi;
  final RestaruntCategoryMapper _restaruntCategoryMapper;

  @override
  Future<Either<Failure, RestaurantCategory>> getRestaurantCategory() async {
    try {
      final response = await _foodApi.getRestaruntCategory();
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
