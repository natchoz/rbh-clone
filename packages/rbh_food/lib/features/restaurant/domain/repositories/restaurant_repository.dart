import 'package:core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:rbh_food/features/restaurant/domain/entities/restaurant.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, Restaurant>> getRestaurantById(String id);
}
