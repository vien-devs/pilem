import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/core/routing/routes/core/main_routes.dart';
import 'package:pilem/core/routing/routes/util/route_const.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/design/my_ds/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = serviceLocator.get();

  late final goRouter = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RoutePath.splashscreen,
    routes: MainRoutes.routes,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 830),
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: kDebugMode,
        locale: const Locale('id', 'ID'),
        title: 'Flutter Demo',
        theme: myDsTheme(context),
        themeMode: ThemeMode.system,
        routerConfig: goRouter,
        // home: const InitialPage(),
      ),
    );
  }
}
