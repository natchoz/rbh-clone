import 'package:flutter/material.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';

abstract class FoodState {
  @override
  List<Object> get props => [];
}

class Initial extends FoodState {}

class Loading extends FoodState {}

class Success extends FoodState {
  Success(
    this.restaurantCategory,
  );
  final RestaurantCategory restaurantCategory;
}

class Error extends FoodState {
  Error({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
