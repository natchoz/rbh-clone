import 'package:core/network/api/api_configuration.dart';
import 'package:core/network/api/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rbh_food/food_module.dart';
import 'package:robinhood_clone/features/favorites/presentation/pages/favorites_page.dart';
import 'package:robinhood_clone/features/home/presentation/home_page.dart';
import 'package:robinhood_clone/features/main/presentation/pages/main_page.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<Dio>((i) => i<DioClient>().dio),
        
        Bind.lazySingleton<DioClient>(
            (i) => DioClient(configuration: ApiConfiguration())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => MainPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/favorites',
          child: (context, args) => FavoritesPage(),
        ),
        ModuleRoute(
          '/food',
          module: FoodModule(),
        ),
      ];
}
