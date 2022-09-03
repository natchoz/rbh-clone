// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:robinhood_clone/routes/router.gr.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('--- MainPage2 ---');

//     return AutoTabsScaffold(
//       // appBarBuilder: (context, tabsRouter) => AppBar(),
//       routes: const [
//         HomeRoute(),
//         FavoritesRoute(),
//         ActivitiesRoute(),
//         MessagesRoute(),
//         AccountRoute(),
//       ],
//       bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: tabsRouter.activeIndex,
//         onTap: tabsRouter.setActiveIndex,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: 'รายการโปรด'),
//           BottomNavigationBarItem(icon: Icon(Icons.list), label: 'กิจกรรม'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.question_answer), label: 'ข้อความ'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle), label: 'บัญชี'),
//         ],
//       ),
//     );
//   }
// }
