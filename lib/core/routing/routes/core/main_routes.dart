import 'package:pilem/core/routing/routes/person_routes.dart';
import 'package:pilem/core/routing/routes/homepage_routes.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/core/routing/routes/search_routes.dart';
import 'package:pilem/core/routing/routes/series_routes.dart';
import 'package:pilem/core/routing/routes/splash_routes.dart';

class MainRoutes {
  MainRoutes._();

  static final routes = [
    ...SplashRoutes.mainRoutes,
    ...HomepageRoutes.mainRoutes,
    ...MoviesRoutes.mainRoutes,
    ...PersonRoutes.mainRoutes,
    ...SeriesRoutes.mainRoutes,
    ...SearchRoutes.mainRoutes,
  ];
}
