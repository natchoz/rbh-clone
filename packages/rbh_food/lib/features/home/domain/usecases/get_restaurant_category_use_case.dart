import 'package:core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';
import 'package:rbh_food/features/home/domain/repositories/food_home_repository.dart';

abstract class GetRestaurantCategoryUseCase {
  Future<Either<Failure, RestaurantCategory>> call();
}

class GetRestaurantCategoryUseCaseImpl extends GetRestaurantCategoryUseCase {
  GetRestaurantCategoryUseCaseImpl(this.restaurantCategoryRepository);

  final FoodHomeRepository restaurantCategoryRepository;

  @override
  Future<Either<Failure, RestaurantCategory>> call() async {
    return restaurantCategoryRepository.getRestaurantCategory();
  }
}
