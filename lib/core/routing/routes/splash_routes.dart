import 'package:go_router/go_router.dart';
import 'package:pilem/core/routing/routes/util/route_const.dart';
import 'package:pilem/ui/splash/splashscreen.dart';

class SplashRoutes {
  SplashRoutes._();

  static final mainRoutes = [
    main,
  ];

  static final main = GoRoute(
    path: RoutePath.splashscreen,
    name: RouteName.splashscreen,
    builder: (context, state) => const Splashscreen(),
  );
}
