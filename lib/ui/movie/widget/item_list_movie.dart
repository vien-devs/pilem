import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/movies_routes.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';

class ItemListMovie extends StatelessWidget {
  const ItemListMovie({
    super.key,
    required this.dataMovie,
  });

  final Movies dataMovie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          MoviesRoutes.toDetailsMovie.name!,
          extra: {
            StringResource.keyMovieId: dataMovie.id.toString(),
          },
        );
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            width: 150.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                GeneralConst.imageBaseURl + (dataMovie.posterPath ?? ''),
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
          SizedBox(height: 8.h),
          Text(
            dataMovie.title,
            style: context.textTheme.titleSmall?.copyWith(
              color: MyDsColors.fog,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
