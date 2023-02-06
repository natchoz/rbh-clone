import 'package:core/utils/rbh_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rbh_food/features/restaurant/domain/entities/menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rbh_food/features/restaurant/presentation/menu_details/bloc/menu_details_bloc.dart';
import 'package:rbh_food/features/restaurant/presentation/menu_details/bloc/menu_details_event.dart';
import 'package:rbh_food/features/restaurant/presentation/menu_details/bloc/menu_details_state.dart';

class MenuDetailsPage extends StatefulWidget {
  const MenuDetailsPage({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  State<MenuDetailsPage> createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  late MenuDetailsBloc _menuDetailsBloc;
  Menu get _menu => widget.menu;

  @override
  void initState() {
    _menuDetailsBloc = Modular.get<MenuDetailsBloc>();
    super.initState();
  }

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
        _menu.name,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
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
              imageUrl: _menu.imageUrl,
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
                          _menu.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        flex: 2,
                      ),
                      const Spacer(),
                      Text(
                        RbhUtils.convertDisplayPrice(_menu.price),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    _menu.description ?? "",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
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
        const Text(
          "Additional requests (if any)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
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
    return BlocBuilder<MenuDetailsBloc, MenuDetailsState>(
      bloc: _menuDetailsBloc,
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: Colors.purple,
                    splashRadius: 32,
                    iconSize: 48,
                    disabledColor: Colors.grey,
                    onPressed: state is EmptyBasket
                        ? null
                        : () {
                            _menuDetailsBloc.add(RemoveMenuEvent());
                          },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      state.count.toString(),
                      style:
                          const TextStyle(fontSize: 32, color: Colors.purple),
                    ),
                  ),
                  IconButton(
                    splashRadius: 32,
                    iconSize: 48,
                    onPressed: () {
                      _menuDetailsBloc.add(AddMenuEvent());
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      // size: 48,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              // Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
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
      },
    );
  }
}
