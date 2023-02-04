import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rbh_food/features/home/domain/entities/restaurant.dart';
import 'package:rbh_food/features/restaurant/presentation/restaurant/widgets/menu_category_item.dart';

class RestaruantPage extends StatelessWidget {
  const RestaruantPage({
    required this.restaurant,
    super.key,
  });

  final Restaurant restaurant;

  static const String routeName = "/restaruant";

  @override
  Widget build(BuildContext context) {
    print("--- RestaruantPage ---");

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildRestaurantAppBar(),
          _buildRestaurantInfo(),
          _buildCategories(),
          _buildCategoryItem(),
        ],
      ),
    );
  }

  Widget _buildRestaurantAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          restaurant.imageUrl ?? "",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRestaurantInfo() {
    return SliverToBoxAdapter();
  }

  Widget _buildCategories() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: restaurant.categoryMenus
              .map(
                (title) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Text(title),
                    onPressed: () {},
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryItem() {
    return SliverList(delegate: SliverChildBuilderDelegate(
      (context, index) {
        return MenuCategoryItem();
      },
    ));
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
