import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robinhood_clone/features/home/presentation/widgets/home_appbar.dart';
import 'package:robinhood_clone/features/home/presentation/widgets/home_menu.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // body: NestedScrollView(
      //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //       return [
      //         HomeAppBar(),
      //       ];
      //     },
      //     body: _buildHomeMenus(),
      //     ),
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   expandedHeight: 200,
          //   floating: false,
          //   pinned: true,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('data'),
          //   ),
          // ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
            sliver: SliverPersistentHeader(
              delegate: HomeAppBar(),
              pinned: false,
              floating: false,
            ),
          ),
          _buildHomeMenus(),
          // SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //   (context, index) => _buildHomeMenus(),
          //   childCount: 1,
          // ))
        ],
      ),
    );
  }

  Widget _buildHomeMenus() => SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          HomeMenu(
            category: 'FOOD',
            title: 'What are you craving...',
            description: 'Time to EAT',
            isComingSoon: false,
            onTap: () {
              debugPrint('FOOD on clicked!');
            },
          ),
          HomeMenu(
            category: 'TRAVEL',
            title: 'Time to travel',
            description: 'Hotels Flights Car Rental...',
            onTap: () {
              debugPrint('TRAVEL on clicked!');
            },
          ),
          HomeMenu(
            category: 'MART',
            title: 'Fresh to your doorst...',
            description: 'Wide-rande of premium...',
            onTap: () {
              debugPrint('MART on clicked!');
            },
          ),
          HomeMenu(
            category: 'EXPRESS',
            title: 'Speedy Delivery',
            description: 'Send a parcel and Mess...',
            onTap: () {
              debugPrint('EXPRESS on clicked!');
            },
          ),
        ],
      );
}
