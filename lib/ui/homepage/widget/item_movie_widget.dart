import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/core/routing/routes/series_routes.dart';

class ItemMovieWidget extends StatelessWidget {
  final String imageUrl;
  final String movieId;
  final bool isSeries;

  const ItemMovieWidget({
    super.key,
    required this.imageUrl,
    required this.movieId,
    this.isSeries = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 130.w,
      child: GestureDetector(
        onTap: () {
          isSeries
              ? context.pushNamed(
                  SeriesRoutes.toDetailsSeries.name!,
                  extra: {
                    StringResource.keySeriesId: movieId,
                  },
                )
              : context.pushNamed(
                  MoviesRoutes.toDetailsMovie.name!,
                  extra: {
                    StringResource.keyMovieId: movieId,
                  },
                );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: Image.network(
            GeneralConst.imageBaseURl + imageUrl,
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
    );
  }
}
