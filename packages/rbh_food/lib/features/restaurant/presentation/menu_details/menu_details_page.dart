import 'package:core/utils/rbh_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rbh_food/features/restaurant/domain/entities/menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rbh_food/features/restaurant/presentation/menu_details/bloc/menu_details_bloc.dart';

class MenuDetailsPage extends StatelessWidget {
  const MenuDetailsPage({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildMenuDetails(),
          _buildAddMenuButtons(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      title: Text(
        menu.name,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Modular.to.pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuDetails() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              height: 150,
              fit: BoxFit.fitWidth,
              imageUrl: menu.imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          menu.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        flex: 2,
                      ),
                      const Spacer(),
                      Text(
                        RbhUtils.convertDisplayPrice(menu.price),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    menu.description ?? "",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  _buildNote(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Additional requests (if any)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 24,
        ),
        TextField(
          maxLines: 2,
          decoration: InputDecoration(
            hintText: "E.g. No veggies, Less spicy",
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddMenuButtons() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                splashRadius: 32,
                iconSize: 48,
                onPressed: () {},
                icon: Icon(
                  Icons.remove_circle_outline,
                  // size: 48,
                  color: Colors.purple,
                ),
              ),

              // InkWell(
              //   borderRadius: BorderRadius.circular(16),
              //   onTap: () {},
              //   child: Icon(
              //     Icons.remove_circle_outline,
              //     size: 48,
              //     color: Colors.purple,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 32, color: Colors.purple),
                ),
              ),
              IconButton(
                splashRadius: 32,
                iconSize: 48,
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle_outline,
                  // size: 48,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          // Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Add to Basket",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
