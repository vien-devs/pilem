import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_chip.dart';

class ItemSimilarMovies extends StatelessWidget {
  const ItemSimilarMovies({
    super.key,
    required this.similarMovie,
  });

  final Movies similarMovie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          MoviesRoutes.toDetailsMovie.name!,
          extra: {
            StringResource.keyMovieId: similarMovie.id.toString(),
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
                GeneralConst.imageBaseURl + (similarMovie.backdropPath ?? ''),
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
                  similarMovie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: MyDsColors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyChip(
                      label: similarMovie.releaseDate.isEmpty
                          ? '- - -'
                          : '${DateTime.parse(similarMovie.releaseDate).year}',
                    ),
                    SizedBox(width: 4.w),
                    MyChip(
                      bgColor: MyDsColors.fog.withOpacity(0.5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                            size: 15.r,
                          ),
                          Text(
                            similarMovie.voteAverage.toStringAsFixed(2),
                            style: context.textTheme.labelMedium?.copyWith(
                              fontSize: 11.sp,
                              color: MyDsColors.white,
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
