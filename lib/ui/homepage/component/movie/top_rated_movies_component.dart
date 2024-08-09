import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/homepage/provider/home_movies_provider.dart';
import 'package:pilem/ui/homepage/widget/item_movie_widget.dart';
import 'package:pilem/ui/homepage/widget/movie_list_shimmer.dart';
import 'package:provider/provider.dart';

class TopRatedMoviesComponent extends StatelessWidget {
  const TopRatedMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeMoviesProvider>();
    return provider.isLoading
        ? const MovieListShimmer()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                InkWell(
                  onTap: () => context.pushNamed(
                    MoviesRoutes.toMovieList.name!,
                    extra: {
                      StringResource.keyListMovieType: 'toprated',
                    },
                  ),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringResource.labelTopRated,
                        style: context.textTheme.titleLarge?.copyWith(
                          color: MyDsColors.fog,
                        ),
                      ),
                      Text(
                        StringResource.labelSeeMore,
                        style: context.textTheme.titleSmall?.copyWith(
                          color: MyDsColors.fog,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: provider.topRatedList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 8.w);
                    },
                    itemBuilder: (context, index) {
                      return ItemMovieWidget(
                        imageUrl: provider.topRatedList[index].posterPath ?? '',
                        movieId: provider.topRatedList[index].id.toString(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
