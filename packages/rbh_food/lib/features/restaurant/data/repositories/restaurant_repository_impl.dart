import 'package:core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:rbh_food/features/restaurant/data/api/restaurant_api.dart';
import 'package:rbh_food/features/restaurant/data/mapper/restaruant_mapper.dart';
import 'package:rbh_food/features/restaurant/domain/entities/restaurant.dart';
import 'package:rbh_food/features/restaurant/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  RestaurantRepositoryImpl(this._restaurantApi, this._restaruntMapper);

  final RestaurantApi _restaurantApi;
  final RestaurantMapper _restaruntMapper;

  @override
  Future<Either<Failure, Restaurant>> getRestaurantById(String id) async {
    try {
      final response = await _restaurantApi.getRestaurant(id);
      return Right(_restaruntMapper.mapRestaurantDtoToEntity(response));
    } on DioError catch (e) {
      print("--- DioError # $e ---");
      return Left(Failure(e.message));
    }
  }
}
