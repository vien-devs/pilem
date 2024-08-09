import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/extensions/theme_extensions.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/ui/movie/widget/shimmer_similar.dart';
import 'package:pilem/ui/series/provider/series_provider.dart';
import 'package:pilem/ui/series/widgets/item_similar_series.dart';
import 'package:provider/provider.dart';

class RecommendationSeriesComponent extends StatelessWidget {
  const RecommendationSeriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SeriesProvider>();
    var similarSeries = provider.recommendationSeries;

    return provider.isLoading
        ? const ShimmerSimilar()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringResource.labelRecommendations,
                style: context.textTheme.titleMedium?.copyWith(
                  color: MyDsColors.fog,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 350.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemRecommendationSeries(
                      similarSeries: similarSeries[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: similarSeries.length,
                ),
              ),
            ],
          );
  }
}
