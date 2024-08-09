import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/util/route_const.dart';
import 'package:pilem/ui/person/detail_person_page.dart';

class PersonRoutes {
  PersonRoutes._();

  static final mainRoutes = [
    toDetailArtist,
  ];

  static final toDetailArtist = GoRoute(
    path: RoutePath.detailPerson,
    name: RouteName.detailPerson,
    builder: (context, state) {
      var extra = state.extra as Map<String, dynamic>;
      return DetailPersonPage(
        personId: extra[StringResource.keyPersonId],
      );
    },
  );
}
