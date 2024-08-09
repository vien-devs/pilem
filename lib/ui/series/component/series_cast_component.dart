import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/movie/widget/item_cast.dart';
import 'package:pilem/ui/movie/widget/shimmer_cast_movie.dart';
import 'package:pilem/ui/series/provider/series_provider.dart';
import 'package:provider/provider.dart';

class SeriesCastComponent extends StatelessWidget {
  const SeriesCastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SeriesProvider>();
    var castList = provider.seriesCast;
    return provider.isLoading
        ? const ShimmerCast()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringResource.labelCast,
                style: context.textTheme.titleMedium?.copyWith(
                  color: MyDsColors.fog,
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 180.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: castList.length,
                  itemBuilder: (context, index) => ItemCast(
                    movieCast: castList[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10.w,
                  ),
                ),
              ),
            ],
          );
  }
}
