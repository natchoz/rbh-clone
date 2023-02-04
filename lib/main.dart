import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:robinhood_clone/app_module.dart';
import 'package:robinhood_clone/features/home/presentation/home_page.dart';
import 'package:robinhood_clone/rbh_app.dart';
import 'package:flutter_modular/flutter_modular.dart';

// final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
//   return await Firebase.initializeApp();
// });

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(
    ModularApp(
      module: AppModule(),
      child: RbhApp(),
    ),
  );
}
