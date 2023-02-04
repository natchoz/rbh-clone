import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rbh_food/features/home/data/api/food_api.dart';
import 'package:rbh_food/features/home/data/mapper/restaruant_category_mapper.dart';
import 'package:rbh_food/features/home/data/repositories/restaruant_repository_impl.dart';
import 'package:rbh_food/features/home/domain/repositories/food_repository.dart';
import 'package:rbh_food/features/home/domain/usecases/get_restaurant_category_use_case.dart';
import 'package:rbh_food/features/home/presentation/bloc/food_bloc.dart';
import 'package:rbh_food/features/home/presentation/food_home_page.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/restaruant_page.dart';

class FoodModule extends Module {
  @override
  List<Bind> get binds => [
        // use cases
        Bind.lazySingleton((i) => GetRestaurantCategoryUseCaseImpl(i())),

        // mapper
        Bind.lazySingleton((i) => RestaruntCategoryMapper()),

        // repository
        Bind.lazySingleton<RestaurantRepository>(
            (i) => RestaruantRepositoryImpl(i(), i())),

        // api
        Bind.lazySingleton((i) => FoodApi(i())),

        // bloc
        Bind.factory((i) => FoodBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => FoodHomePage(),
        ),
        ChildRoute(
          '/restaruant',
          child: (context, args) => RestaruantPage(restaurant: args.data),
        ),
      ];
}
