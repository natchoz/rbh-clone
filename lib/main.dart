import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:robinhood_clone/features/home/presentation/pages/home/home_page.dart';
import 'package:robinhood_clone/features/main/presentation/pages/main_page.dart';
import 'package:robinhood_clone/routes/router.gr.dart';

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(
    const ProviderScope(
      child: RobinhoodApp(),
    ),
  );
}

// Future<bool> isSignedIn() async {
//   FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     if (user == null) {
//       print("User is signed out");
//       return Future.value(false) ;
//     } else {
//       print("User is signed in");
//       return true;
//     }
//   });
// }

class RobinhoodApp extends StatefulWidget {
  const RobinhoodApp({Key? key}) : super(key: key);

  @override
  State<RobinhoodApp> createState() => _RobinhoodAppState();
}

class _RobinhoodAppState extends State<RobinhoodApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Robinhood Clone App',
    //   theme: ThemeData(
    //     primarySwatch: Colors.purple,
    //   ),
    //   // home: const MainPage(),
    //   builder: (context, child) {
    //     ScreenUtil.init(
    //         BoxConstraints(
    //             maxWidth: MediaQuery.of(context).size.width,
    //             maxHeight: MediaQuery.of(context).size.height),
    //         designSize: const Size(375, 812),
    //         context: context,
    //         minTextAdapt: true,
    //         orientation: Orientation.portrait);
    //     return child!;
    //   },
    //   initialRoute: MainPage.routeName,
    //   routes: {
    //     MainPage.routeName: (context) => const MainPage(),
    //     HomePage.routeName: (context) => const HomePage(),
    //   },
    // );
    return MaterialApp.router(
      title: 'Robinhood Clone App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: const MainPage(),
      builder: (context, child) {
        ScreenUtil.init(
            BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height),
            designSize: const Size(375, 812),
            context: context,
            minTextAdapt: true,
            orientation: Orientation.portrait);
        // return SafeArea(child: child!);
        return child!;
      },
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
