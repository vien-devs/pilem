import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/util/route_const.dart';
import 'package:pilem/ui/movie/detail_movie_page.dart';
import 'package:pilem/ui/movie/list_movie_page.dart';
import 'package:pilem/ui/movie/movie_review_page.dart';

class MoviesRoutes {
  MoviesRoutes._();

  static final mainRoutes = [
    toDetailsMovie,
    toMovieReviews,
    toMovieList,
  ];

  static final toDetailsMovie = GoRoute(
    path: RoutePath.detailMovie,
    name: RouteName.detailMovie,
    builder: (context, state) {
      var extra = state.extra as Map<String, dynamic>;
      return DetailMoviePage(
        movieId: extra[StringResource.keyMovieId],
      );
    },
  );

  static final toMovieReviews = GoRoute(
    path: RoutePath.reviewMovie,
    name: RouteName.reviewMovie,
    builder: (context, state) {
      var extra = state.extra as Map<String, dynamic>;
      return MovieReviewPage(
        movieId: extra[StringResource.keyMovieId],
      );
    },
  );

  static final toMovieList = GoRoute(
    path: RoutePath.listMovie,
    name: RouteName.listMovie,
    builder: (context, state) {
      var extra = state.extra as Map<String, dynamic>;
      return ListMoviePage(
        listType: extra[StringResource.keyListMovieType],
      );
    },
  );
}
