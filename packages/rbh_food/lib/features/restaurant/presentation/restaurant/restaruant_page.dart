import 'package:flutter/material.dart';
import 'package:rbh_food/features/restaurant/domain/entities/category_menu.dart';
import 'package:rbh_food/features/restaurant/domain/entities/restaurant.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/bloc/restaurant_bloc.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/bloc/restaurant_event.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/bloc/restaurant_state.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/widgets/menu_card.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/widgets/menu_category_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestaruantPage extends StatelessWidget {
  const RestaruantPage({
    required this.restaurantId,
    super.key,
  });

  final String restaurantId;

  static const String routeName = "/restaruant";

  @override
  Widget build(BuildContext context) {
    print("--- RestaruantPage ---");

    return Scaffold(
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        bloc: Modular.get<RestaurantBloc>()..add(LoadDataEvent(restaurantId)),
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is Success) {
            return CustomScrollView(
              slivers: [
                _buildRestaurantAppBar(state.restaurant),
                _buildRestaurantInfo(state.restaurant),
                _buildCategories(state.restaurant),
                _buildCategoryItem(state.restaurant.categoryMenus),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildRestaurantAppBar(Restaurant restaurant) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          restaurant.imageUrl ?? "",
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Modular.to.pop();
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo(Restaurant restaurant) {
    return SliverToBoxAdapter();
  }

  Widget _buildCategories(Restaurant restaurant) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: restaurant.categoryMenus
              .map(
                (category) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Text(category.name),
                    onPressed: () {},
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(List<CategoryMenu> categoryMenus) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return MenuCategoryItem(
          title: categoryMenus[index].name,
          items: categoryMenus[index]
              .menus
              .map((menu) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MenuCard(
                      image: menu.imageUrl,
                      title: menu.name,
                      price: menu.price.toDouble(),
                      onTab: () {
                        Modular.to.pushNamed("./menu", arguments: menu);
                      },
                    ),
                  ))
              .toList(),
        );
      }, childCount: categoryMenus.length)),
    );
  }

  Widget _buildMenu() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/1108104/pexels-photo-1108104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
