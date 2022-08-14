// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../features/account/presentation/pages/account_page.dart' as _i6;
import '../features/activities/presentation/pages/activities_page.dart' as _i4;
import '../features/favorites/presentation/pages/favorites_page.dart' as _i3;
import '../features/home/presentation/pages/home/home_page.dart' as _i2;
import '../features/main/presentation/pages/main_page2.dart' as _i1;
import '../features/messages/presentation/pages/messages_page.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    FavoritesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.FavoritesPage());
    },
    ActivitiesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ActivitiesPage());
    },
    MessagesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.MessagesPage());
    },
    AccountRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AccountPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(MainRoute.name, path: '/', children: [
          _i7.RouteConfig(HomeRoute.name,
              path: 'home-page', parent: MainRoute.name),
          _i7.RouteConfig(FavoritesRoute.name,
              path: 'favorites-page', parent: MainRoute.name),
          _i7.RouteConfig(ActivitiesRoute.name,
              path: 'activities-page', parent: MainRoute.name),
          _i7.RouteConfig(MessagesRoute.name,
              path: 'messages-page', parent: MainRoute.name),
          _i7.RouteConfig(MessagesRoute.name,
              path: 'messages-page', parent: MainRoute.name),
          _i7.RouteConfig(AccountRoute.name,
              path: 'account-page', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.FavoritesPage]
class FavoritesRoute extends _i7.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: 'favorites-page');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i4.ActivitiesPage]
class ActivitiesRoute extends _i7.PageRouteInfo<void> {
  const ActivitiesRoute()
      : super(ActivitiesRoute.name, path: 'activities-page');

  static const String name = 'ActivitiesRoute';
}

/// generated route for
/// [_i5.MessagesPage]
class MessagesRoute extends _i7.PageRouteInfo<void> {
  const MessagesRoute() : super(MessagesRoute.name, path: 'messages-page');

  static const String name = 'MessagesRoute';
}

/// generated route for
/// [_i6.AccountPage]
class AccountRoute extends _i7.PageRouteInfo<void> {
  const AccountRoute() : super(AccountRoute.name, path: 'account-page');

  static const String name = 'AccountRoute';
}
