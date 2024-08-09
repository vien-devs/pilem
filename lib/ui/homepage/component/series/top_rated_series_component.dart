import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/homepage/provider/home_series_provider.dart';
import 'package:pilem/ui/homepage/widget/item_movie_widget.dart';
import 'package:pilem/ui/homepage/widget/movie_list_shimmer.dart';
import 'package:provider/provider.dart';

class TopRatedSeriesComponent extends StatelessWidget {
  const TopRatedSeriesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeSeriesProvider>();
    var topRatedSeries = provider.topRatedList;
    return provider.isLoading
        ? const MovieListShimmer()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringResource.labelTopRated,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: MyDsColors.fog,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        StringResource.labelSeeMore,
                        style: context.textTheme.titleSmall?.copyWith(
                          color: MyDsColors.fog,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 200.h,
                  child: provider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: topRatedSeries.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 8.w);
                          },
                          itemBuilder: (context, index) {
                            return ItemMovieWidget(
                              imageUrl: topRatedSeries[index].posterPath ?? '',
                              movieId: topRatedSeries[index].id.toString(),
                              isSeries: true,
                            );
                          },
                        ),
                ),
              ],
            ),
          );
  }
}
