import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_chip.dart';
import 'package:pilem/ui/movie/provider/movie_provider.dart';
import 'package:pilem/ui/movie/widget/shimmer_movie_info.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class InfoMovieComponent extends StatelessWidget {
  const InfoMovieComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MovieProvider>();
    var detailMovie = provider.movieDetail;

    return provider.isLoading
        ? const ShimmerMovieInfo()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      detailMovie?.title ?? '',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MyChip(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: MyDsColors.warning,
                          size: 20.r,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          detailMovie?.voteAverage.toStringAsFixed(1) ?? '',
                          style: context.textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                height: 25.h,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MyChip(
                      label: detailMovie?.genres[index].name ?? '',
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 4.w);
                  },
                  itemCount: detailMovie?.genres.length ?? 0,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  MyChip(
                    label: '${detailMovie?.runtime ?? 0} Minutes',
                  ),
                  SizedBox(width: 12.w),
                  MyChip(
                    label: (detailMovie?.releaseDate ?? '').isEmpty
                        ? '-'
                        : DateTime.parse(detailMovie?.releaseDate ?? '')
                            .year
                            .toString(),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              ReadMoreText(
                detailMovie?.overview ?? '',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: StringResource.labelReadMore,
                trimExpandedText: StringResource.labelReadLess,
                moreStyle: context.textTheme.bodySmall?.copyWith(
                  color: MyDsColors.alert,
                ),
                lessStyle: context.textTheme.bodySmall?.copyWith(
                  color: MyDsColors.alert,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => context.pushNamed(
                        MoviesRoutes.toMovieReviews.name!,
                        extra: {
                          StringResource.keyMovieId: detailMovie?.id.toString(),
                        },
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.speaker_notes_rounded,
                            color: MyDsColors.primaryBase,
                          ),
                          Text(
                            'Reviews',
                            style: context.textTheme.labelSmall?.copyWith(
                              color: MyDsColors.primaryBase,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          const Icon(
                            Icons.movie_filter_rounded,
                            color: MyDsColors.primaryBase,
                          ),
                          Text(
                            'Trailer',
                            style: context.textTheme.labelSmall?.copyWith(
                              color: MyDsColors.primaryBase,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
