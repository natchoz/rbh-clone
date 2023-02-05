import 'package:core/error/failure.dart';
import 'package:rbh_food/features/home/domain/entities/home_restaurant.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';
import 'package:dartz/dartz.dart';

abstract class FoodHomeRepository {
  Future<Either<Failure, RestaurantCategory>> getRestaurantCategory();
}