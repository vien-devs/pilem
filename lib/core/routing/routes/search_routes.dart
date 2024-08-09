import 'package:go_router/go_router.dart';
import 'package:pilem/core/routing/routes/util/route_const.dart';
import 'package:pilem/ui/search/search_page.dart';

class SearchRoutes {
  SearchRoutes._();

  static final mainRoutes = [
    toSearchPage,
  ];

  static final toSearchPage = GoRoute(
    path: RoutePath.searchPage,
    name: RouteName.searchPage,
    builder: (context, state) => const SearchPage(),
  );
}
