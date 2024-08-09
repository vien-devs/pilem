import 'package:go_router/go_router.dart';
import 'package:pilem/core/routing/routes/util/route_const.dart';
import 'package:pilem/ui/homepage/initial_page.dart';

class HomepageRoutes {
  HomepageRoutes._();

  static final mainRoutes = [
    main,
  ];

  static final main = GoRoute(
    path: RoutePath.homepage,
    name: RouteName.homepage,
    builder: (context, state) => const InitialPage(),
  );
}
