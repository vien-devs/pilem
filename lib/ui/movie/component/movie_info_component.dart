import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_image_network.dart';
import 'package:pilem/ui/movie/provider/movie_provider.dart';
import 'package:pilem/ui/movie/widget/shimmer_movie_info.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class MovieInfoComponent extends StatelessWidget {
  const MovieInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MovieProvider>();
    var data = provider.movieDetail;

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
                        url: data?.posterPath ?? '',
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data?.title ?? '',
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
                                data?.genres[index].name ?? '',
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
                            itemCount: data?.genres.length ?? 0,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${data?.runtime} mins',
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
                              (data?.releaseDate ?? '').isEmpty
                                  ? '-'
                                  : DateTime.parse(data?.releaseDate ?? '')
                                      .year
                                      .toString(),
                              style: context.textTheme.labelLarge?.copyWith(
                                color: MyDsColors.white,
                              ),
                            ),
                          ],
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
                      onTap: () => context.pushNamed(
                        MoviesRoutes.toMovieReviews.name!,
                        extra: {
                          StringResource.keyMovieId: data?.id.toString(),
                        },
                      ),
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
                                '${data?.voteAverage.toStringAsFixed(1)}/10',
                                style: context.textTheme.titleSmall
                                    ?.copyWith(color: MyDsColors.white),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '${data?.voteCount} votes',
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
                      data?.overview ?? '',
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
