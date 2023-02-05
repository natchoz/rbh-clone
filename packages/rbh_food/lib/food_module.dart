import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rbh_food/features/home/data/api/food_api.dart';
import 'package:rbh_food/features/home/data/mapper/home_restaruant_category_mapper.dart';
import 'package:rbh_food/features/home/data/repositories/food_home_repository_impl.dart';
import 'package:rbh_food/features/home/domain/repositories/food_home_repository.dart';
import 'package:rbh_food/features/home/domain/usecases/get_restaurant_category_use_case.dart';
import 'package:rbh_food/features/home/presentation/bloc/food_bloc.dart';
import 'package:rbh_food/features/home/presentation/food_home_page.dart';
import 'package:rbh_food/features/restaurant/data/api/restaurant_api.dart';
import 'package:rbh_food/features/restaurant/data/mapper/restaruant_mapper.dart';
import 'package:rbh_food/features/restaurant/data/repositories/restaurant_repository_impl.dart';
import 'package:rbh_food/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:rbh_food/features/restaurant/domain/usecases/get_restaurant_use_case.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/bloc/restaurant_bloc.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/restaruant_page.dart';

class FoodModule extends Module {
  @override
  List<Bind> get binds => [
        // use cases
        Bind.lazySingleton((i) => GetRestaurantCategoryUseCaseImpl(i())),
        Bind.lazySingleton((i) => GetRestaurantUseCaseImpl(i())),

        // mapper
        Bind.lazySingleton((i) => RestaruntCategoryMapper()),
        Bind.lazySingleton((i) => RestaurantMapper()),

        // repository
        Bind.lazySingleton<FoodHomeRepository>(
            (i) => FoodHomeRepositoryImpl(i(), i())),

        Bind.lazySingleton<RestaurantRepository>(
            (i) => RestaurantRepositoryImpl(i(), i())),

        // api
        Bind.lazySingleton((i) => FoodApi(i())),
        Bind.lazySingleton((i) => RestaurantApi(i())),

        // bloc
        Bind.factory((i) => FoodBloc(i())),
        Bind.factory((i) => RestaurantBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => FoodHomePage(),
        ),
        ChildRoute(
          '/restaruant',
          child: (context, args) => RestaruantPage(restaurantId: args.data),
        ),
      ];
}
