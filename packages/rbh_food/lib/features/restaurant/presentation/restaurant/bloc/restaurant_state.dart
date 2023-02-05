
import 'package:rbh_food/features/restaurant/domain/entities/restaurant.dart';

abstract class RestaurantState {}

class Initial extends RestaurantState {}

class Loading extends RestaurantState {}

class Success extends RestaurantState {
  Success(
    this.restaurant,
  );
  final Restaurant restaurant;
}

class Error extends RestaurantState {
  Error({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
