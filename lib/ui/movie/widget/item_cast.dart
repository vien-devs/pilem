import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/core/routing/routes/person_routes.dart';
import 'package:pilem/data/movie/cast_movie.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';

class ItemCast extends StatelessWidget {
  const ItemCast({
    super.key,
    required this.movieCast,
  });

  final CastMovie movieCast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.pushNamed(
            PersonRoutes.toDetailArtist.name!,
            extra: {
              StringResource.keyPersonId: movieCast.id.toString(),
            },
          ),
          child: SizedBox(
            width: 90.r,
            height: 90.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.network(
                GeneralConst.imageBaseURl + (movieCast.profilePath ?? ''),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    GeneralConst.profileErrorPlaceholder,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: 100.w,
          child: Text(
            movieCast.originalName,
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: MyDsColors.white,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 6.h),
        SizedBox(
          width: 100.w,
          child: Text(
            movieCast.character,
            style: context.textTheme.labelMedium?.copyWith(
              fontSize: 10.sp,
              color: MyDsColors.fog,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
