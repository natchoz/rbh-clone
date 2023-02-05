import 'package:core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:rbh_food/features/restaurant/domain/entities/restaurant.dart';
import 'package:rbh_food/features/restaurant/domain/repositories/restaurant_repository.dart';

abstract class GetRestaurantUseCase {
  Future<Either<Failure, Restaurant>> call(String id);
}

class GetRestaurantUseCaseImpl extends GetRestaurantUseCase {
  GetRestaurantUseCaseImpl(this.restaurantRepository);

  final RestaurantRepository restaurantRepository;

  @override
  Future<Either<Failure, Restaurant>> call(String id) async {
    return restaurantRepository.getRestaurantById(id);
  }
}
