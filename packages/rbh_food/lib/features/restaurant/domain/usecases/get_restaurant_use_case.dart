import 'package:core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';
import 'package:rbh_food/features/home/domain/repositories/food_repository.dart';
import 'package:rbh_food/features/restaurant/domain/entities/restaurant.dart';

abstract class GetRestaurantUseCase {
  Future<Either<Failure, Restaurant>> call();
}

class GetRestaurantUseCaseImpl extends GetRestaurantUseCase {
  GetRestaurantUseCaseImpl(this.restaurantCategoryRepository);

  final RestaurantRepository restaurantCategoryRepository;

  @override
  Future<Either<Failure, Restaurant>> call() async {
    return restaurantCategoryRepository.getRestaurantCategory();
  }
}
