import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/core/routing/routes/series_routes.dart';
import 'package:pilem/data/search/search_result.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_chip.dart';
import 'package:pilem/ui/search/provider/search_provider.dart';

class ItemSearchResult extends StatelessWidget {
  const ItemSearchResult({
    super.key,
    required this.dataSearch,
    required this.searchType,
  });

  final SearchResult dataSearch;
  final String searchType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (searchType == SearchType.movie.name) {
          context.pushNamed(
            MoviesRoutes.toDetailsMovie.name!,
            extra: {
              StringResource.keyMovieId: dataSearch.id.toString(),
            },
          );
        } else {
          context.pushNamed(
            SeriesRoutes.toDetailsSeries.name!,
            extra: {
              StringResource.keySeriesId: dataSearch.id.toString(),
            },
          );
        }
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120.h,
            width: 90.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                GeneralConst.imageBaseURl + (dataSearch.posterPath ?? ''),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dataSearch.title ?? dataSearch.name ?? '',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: MyDsColors.fog,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Text(
                  dataSearch.overview,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: MyDsColors.fog,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    MyChip(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: MyDsColors.warning,
                            size: 15.r,
                          ),
                          Text(
                            dataSearch.voteAverage.toStringAsFixed(2),
                            style: context.textTheme.labelMedium?.copyWith(
                              color: MyDsColors.fog,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    MyChip(
                      label: '${DateTime.parse(
                        dataSearch.releaseDate ?? dataSearch.firstAirDate!,
                      ).year}',
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
