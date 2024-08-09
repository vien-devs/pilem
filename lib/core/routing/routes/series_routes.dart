import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/util/route_const.dart';
import 'package:pilem/ui/series/detail_series_page.dart';

class SeriesRoutes {
  SeriesRoutes._();

  static final mainRoutes = [
    toDetailsSeries,
  ];

  static final toDetailsSeries = GoRoute(
    path: RoutePath.detailSeries,
    name: RouteName.detailSeries,
    builder: (context, state) {
      var extra = state.extra as Map<String, dynamic>;
      return DetailSeriesPage(
        seriesId: extra[StringResource.keySeriesId],
      );
    },
  );
}
