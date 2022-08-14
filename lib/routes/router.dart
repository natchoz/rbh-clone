// import 'package:auto_route/annotations.dart';

// part 'app_router.gr.dart';

// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[],
// )
// // extend the generated private router

import 'package:auto_route/auto_route.dart';
import 'package:robinhood_clone/features/account/presentation/pages/account_page.dart';
import 'package:robinhood_clone/features/activities/presentation/pages/activities_page.dart';
import 'package:robinhood_clone/features/favorites/presentation/pages/favorites_page.dart';
import 'package:robinhood_clone/features/home/presentation/pages/home/home_page.dart';
import 'package:robinhood_clone/features/main/presentation/pages/main_page2.dart';
import 'package:robinhood_clone/features/messages/presentation/pages/messages_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  // AutoRoute(
  //   page: MainPage,
  //   initial: true,
  // ),

  AutoRoute(
    page: MainPage,
    initial: true,
    children: [
      AutoRoute(page: HomePage),
      AutoRoute(page: FavoritesPage),
      AutoRoute(page: ActivitiesPage),
      AutoRoute(page: MessagesPage),
      AutoRoute(page: MessagesPage),
      AutoRoute(page: AccountPage),
    ],
  ),
])
class $AppRouter {}
