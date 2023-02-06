import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rbh_food/features/home/domain/entities/home_restaurant.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant_category.dart';
import 'package:rbh_food/features/home/presentation/bloc/food_bloc.dart';
import 'package:rbh_food/features/home/presentation/bloc/food_event.dart';
import 'package:rbh_food/features/home/presentation/bloc/food_state.dart';
import 'package:rbh_food/features/home/presentation/widgets/product_card.dart';
import 'package:rbh_food/features/home/presentation/widgets/restaruant_category_title.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/restaruant_page.dart';

class FoodHomePage extends StatelessWidget {
  static const String routeName = "/food";

  @override
  Widget build(BuildContext context) {
    print("--- build # ENTER ---");

    return Scaffold(
      body: BlocBuilder<FoodBloc, FoodState>(
          bloc: Modular.get<FoodBloc>()..add(LoadDataEvent()),
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is Success) {
              return CustomScrollView(
                slivers: [
                  _buildAppBar(),
                  _buildRecommendedRestaurants(
                      state.restaurantCategory.recommendedRestaurants),
                  _buildTopRestaurants(
                      state.restaurantCategory.bestChineseRestaurants),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      // elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedRestaurants(List<HomeRestaurant> data) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const RestaurantCategoryTitle("Recommended For You"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: data
                  .map(
                    (restaurant) => GestureDetector(
                      child: ProductCard(
                        imageUrl: (restaurant.imageUrl?.isNotEmpty ?? false)
                            ? restaurant.imageUrl!
                            : "https://images.pexels.com/photos/1108104/pexels-photo-1108104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                        width: 150,
                        height: 150,
                        title: restaurant.name,
                        description: restaurant.description,
                      ),
                      onTap: () {
                        print("--- Go to details ---");
                        Modular.to.pushNamed("./restaruant",
                            arguments: restaurant.id);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopRestaurants(List<HomeRestaurant> data) {
    print("--- _buildTopRestaurants # ENTER ---");

    return SliverToBoxAdapter(
      child: Column(
        children: [
          RestaurantCategoryTitle("Top Restaurants"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: data
                  .map(
                    (restaurant) => ProductCard(
                      imageUrl:
                          "https://images.pexels.com/photos/1108104/pexels-photo-1108104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      width: 150,
                      height: 150,
                      title: restaurant.name,
                      description: restaurant.description,
                      distance: restaurant.distance,
                      rating: restaurant.rating,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
