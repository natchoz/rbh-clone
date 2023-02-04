import 'package:flutter/material.dart';
import 'package:rbh_food/features/home/presentation/food_home_page.dart';
import 'package:robinhood_clone/common/app_image.dart';
import 'package:robinhood_clone/features/home/presentation/widgets/home_appbar.dart';
import 'package:robinhood_clone/features/home/presentation/widgets/home_menu.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 32),
            sliver: SliverPersistentHeader(
              delegate: HomeAppBar(),
              pinned: false,
              floating: false,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: _buildHomeMenus(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeMenus(BuildContext context) => SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          HomeMenu(
            image: AppImage.foodMenu,
            category: 'FOOD',
            menu: 'กินข้าวกัน',
            title: 'หิวแล้ว หาอะไรกินไหม',
            description: 'มีครบทุกอย่างที่อยากกิน',
            isComingSoon: false,
            onTap: () {
              debugPrint('FOOD on clicked!');
              Modular.to.pushNamed(FoodHomePage.routeName);
            },
          ),
          HomeMenu(
            image: AppImage.travelMenu,
            category: 'TRAVEL',
            menu: 'เที่ยวกัน',
            title: 'รู้นะ อยากไปเที่ยวแล้วใช่ไหม',
            description: 'ที่พัก ตั๋วเครื่องเบิน รถเช่า ทัวร์',
            onTap: () {
              debugPrint('TRAVEL on clicked!');
            },
          ),
          HomeMenu(
            image: AppImage.martMenu,
            category: 'MART',
            menu: 'ซื้อของกัน',
            title: 'อยากได้อะไรไหม ไปช้อปกัน',
            description: 'ช้อปจากร้านและซูเปอร์ชั้นนำ.',
            onTap: () {
              debugPrint('MART on clicked!');
            },
          ),
          HomeMenu(
            image: AppImage.expressMenu,
            category: 'EXPRESS',
            menu: 'ส่งของกัน',
            title: 'ส่งของเร็วทันใจ',
            description: 'ไรเดอร์พร้อมบริการ',
            onTap: () {
              debugPrint('EXPRESS on clicked!');
            },
          ),
        ],
      );
}
