import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/extensions/date_time_formatter_extension.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_image_network.dart';
import 'package:pilem/ui/movie/widget/shimmer_movie_info.dart';
import 'package:pilem/ui/series/provider/series_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class SeriesInfoComponent extends StatelessWidget {
  const SeriesInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SeriesProvider>();
    var series = provider.detailSeries;

    return provider.isLoading
        ? const ShimmerMovieInfo()
        : Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: SizedBox(
                      width: 130.w,
                      height: 200.h,
                      child: MyImageNetwork(
                        url: series?.posterPath ?? '',
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          series?.name ?? '',
                          style: context.textTheme.titleLarge?.copyWith(
                            color: MyDsColors.white,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        SizedBox(
                          width: double.infinity,
                          height: 25.h,
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Text(
                                series?.genres[index].name ?? '',
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: MyDsColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                    color: MyDsColors.white,
                                  ),
                                ),
                              );
                            },
                            itemCount: series?.genres.length ?? 0,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${series?.numberOfSeasons} seasons',
                              style: context.textTheme.labelLarge?.copyWith(
                                color: MyDsColors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Text(
                                '-',
                                style: context.textTheme.labelLarge?.copyWith(
                                  color: MyDsColors.white,
                                ),
                              ),
                            ),
                            Text(
                              '${series?.numberOfEpisodes} episodes',
                              style: context.textTheme.labelLarge?.copyWith(
                                color: MyDsColors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          (series?.firstAirDate ?? '').isEmpty
                              ? '-'
                              : '''First Airing: ${DateTime.parse(series?.firstAirDate ?? '').ddMMMMyyyy(dateDelimiter: ' ')}''',
                          style: context.textTheme.labelLarge?.copyWith(
                            color: MyDsColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: MyDsColors.evergreen.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.play_circle,
                          color: MyDsColors.white,
                          size: 30,
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Watch \nTrailer',
                              style: context.textTheme.labelMedium?.copyWith(
                                color: MyDsColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                      child: const VerticalDivider(
                        width: 20,
                        thickness: 1,
                        color: MyDsColors.fog,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.yellowAccent,
                            size: 40,
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${series?.voteAverage.toStringAsFixed(1)}/10',
                                style: context.textTheme.titleSmall
                                    ?.copyWith(color: MyDsColors.white),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '${series?.voteCount} votes',
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: MyDsColors.fog,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: const Divider(
                  thickness: 5,
                  color: MyDsColors.fog,
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: MyDsColors.evergreen.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: MyDsColors.white,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    ReadMoreText(
                      series?.overview ?? '',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: MyDsColors.fog,
                      ),
                      textAlign: TextAlign.justify,
                      trimLines: 5,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: StringResource.labelReadMore,
                      trimExpandedText: StringResource.labelReadLess,
                      moreStyle: context.textTheme.bodyLarge?.copyWith(
                        color: MyDsColors.alert,
                        fontWeight: FontWeight.bold,
                      ),
                      lessStyle: context.textTheme.bodyLarge?.copyWith(
                        color: MyDsColors.alert,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
