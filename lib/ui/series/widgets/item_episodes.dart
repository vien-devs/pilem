import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/series_routes.dart';
import 'package:pilem/data/homepage/series.dart';
import 'package:pilem/data/series/episode.dart';
import 'package:pilem/design/extensions/date_time_formatter_extension.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_chip.dart';

class ItemEpisodes extends StatelessWidget {
  const ItemEpisodes({
    super.key,
    required this.episode,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120.w,
            height: 70.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                GeneralConst.imageBaseURl + (episode.stillPath ?? ''),
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
                  'Episode ${episode.episodeNumber}:',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: MyDsColors.fog,
                  ),
                ),
                Text(
                  episode.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MyDsColors.fog,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  DateTime.parse(episode.airDate)
                      .ddMMMMyyyy(dateDelimiter: ' '),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: MyDsColors.fog,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
