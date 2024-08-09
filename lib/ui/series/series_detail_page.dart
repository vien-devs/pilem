import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pilem/common/const/general_const.dart';
import 'package:pilem/design/common/app_bar.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:pilem/design/widgets/my_shimmer.dart';
import 'package:pilem/ui/series/component/season_episodes_component.dart';
import 'package:pilem/ui/series/component/series_cast_component.dart';
import 'package:pilem/ui/series/component/series_info_component.dart';
import 'package:pilem/ui/series/component/recommendation_series_component.dart';
import 'package:pilem/ui/series/provider/series_provider.dart';
import 'package:provider/provider.dart';

class SeriesDetailPage extends StatelessWidget {
  const SeriesDetailPage({
    super.key,
    required this.seriesId,
  });

  final String seriesId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SeriesProvider(seriesId),
      child: _SeriesDetailView(),
    );
  }
}

class _SeriesDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SeriesProvider>();
    var series = provider.detailSeries;

    return Scaffold(
      appBar: popTextAppBar('TV Series', context),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          provider.isLoading
              ? MyShimmer.rectangular(height: 250.h)
              : Container(
                  width: double.infinity,
                  height: 250.h,
                  color: MyDsColors.granite,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          GeneralConst.imageBaseURl +
                              (series?.backdropPath ?? ''),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SeriesInfoComponent(),
                SizedBox(height: 12.h),
                const SeasonEpisodesComponent(),
                SizedBox(height: 12.h),
                const SeriesCastComponent(),
                const RecommendationSeriesComponent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
