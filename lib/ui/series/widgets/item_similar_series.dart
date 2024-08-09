import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/series_routes.dart';
import 'package:pilem/data/homepage/series.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_chip.dart';

class ItemRecommendationSeries extends StatelessWidget {
  const ItemRecommendationSeries({
    super.key,
    required this.similarSeries,
  });

  final Series similarSeries;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          SeriesRoutes.toDetailsSeries.name!,
          extra: {
            StringResource.keySeriesId: similarSeries.id.toString(),
          },
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150.w,
            height: 80.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                GeneralConst.imageBaseURl + (similarSeries.backdropPath ?? ''),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    GeneralConst.noImageErrorPlaceholder,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  similarSeries.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: MyDsColors.fog,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyChip(
                      label: similarSeries.firstAirDate.isEmpty
                          ? '- - -'
                          : '${DateTime.parse(similarSeries.firstAirDate).year}',
                    ),
                    SizedBox(width: 4.w),
                    MyChip(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: MyDsColors.warning,
                            size: 15.r,
                          ),
                          Text(
                            similarSeries.voteAverage.toStringAsFixed(2),
                            style: context.textTheme.labelSmall?.copyWith(
                              color: MyDsColors.fog,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
